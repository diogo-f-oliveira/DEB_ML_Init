function [data, auxData, metaData, txtData, weights] = mydata_Sagittarius_serpentarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Sagittariidae';
metaData.species    = 'Sagittarius_serpentarius'; 
metaData.species_en = 'Secretarybird'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 45;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 195;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 85;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Todd1988';
data.Wwi = 3.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
  comment.Wwi = '2.3 till 4.27 kg; females slightly smaller than males';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
tWWW = [ ...
     1   87     82.3    84
     2   83.6   76      78.7
     3   87.6   85      87.6
     4  100.7  101     105
     5  120    125.7   125.1
     6  139    164.7   149
     7  155.5  185.5   169.8
     8  179    228.4   190
     9  207.8  285.5   211.5
    10  237.8  326.4   231
    11  266.7  376.1   267.9
    12  323    450     325
    13  367    504     390.3
    14  475    589.3   460.5
    15  525    657.1   521.7
    16  577.7  740.5   583.6
    17  625.5  866.2   660
    18  705    962     725.9
    19  795   1038.7   851.5
    20  888   1080.5   937
    21  984.5 1175.8   NaN
    22 1076.5 1257    1161.5
    23 1122.5 1339.7  1227
    24 1181   1434.6  1380
    25 1283.5 1457.7  1509
    26 1350   1542.5  1630
    27 1334   1617.8   NaN
    28 1417   1696    1790
    29 1476.5 1807    1803.5
    30 1510   1873    1883
    31 1596   1918.1  1967
    32  NaN   2042    2035.3
    33 1790   2124    2120
    34 1705   2179.3  2134
    35  NaN   2296.3  2246
    36 1976.5 2352     NaN
    37 2090   2370.7  2415];    
data.tW1 = tWWW(~isnan(tWWW(:,2)),[1 2]);
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Todd1988';
%
data.tW2 = tWWW(~isnan(tWWW(:,3)),[1 3]);
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Todd1988';
%
data.tW3 = tWWW(~isnan(tWWW(:,4)),[1 4]);
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Todd1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW3 = weights.tW3 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Chick 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Endemic to the Makgadikgadi Pans, Botswana';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TYT8'; % Cat of Life
metaData.links.id_ITIS = '175692'; % ITIS
metaData.links.id_EoL = '1049539'; % Ency of Life
metaData.links.id_Wiki = 'Sagittarius_serpentarius'; % Wikipedia
metaData.links.id_ADW = 'Sagittarius_serpentarius'; % ADW
metaData.links.id_Taxo = '52756'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'DCBCCEB89FD9FC3F'; % avibase
metaData.links.id_birdlife = 'secretarybird-sagittarius-serpentarius'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sagittarius_serpentarius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Todd1988'; type = 'Article'; bib = [ ... 
'author = {W. T. Todd}, ' ... 
'year = {1988}, ' ...
'title = {Hand-rearing the secretary bird \emph{Sagittarius serpentarius} at {Oklahoma City Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {27}, ' ...
'pages = {258--263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049539/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

