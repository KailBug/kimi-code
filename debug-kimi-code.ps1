$oldTsxTsconfigPath = $env:TSX_TSCONFIG_PATH

try {
  Set-Location 'D:\kimi-code'
  $env:TSX_TSCONFIG_PATH = 'D:\kimi-code\apps\kimi-code\tsconfig.dev.json'

  node.exe `
    --enable-source-maps `
    --inspect-brk=127.0.0.1:9229 `
    --import tsx `
    --import file:///D:/kimi-code/build/register-raw-text-loader.mjs `
    ./apps/kimi-code/src/main.ts
}
finally {
  if ($null -eq $oldTsxTsconfigPath) {
    Remove-Item Env:TSX_TSCONFIG_PATH -ErrorAction SilentlyContinue
  }
  else {
    $env:TSX_TSCONFIG_PATH = $oldTsxTsconfigPath
  }
}
