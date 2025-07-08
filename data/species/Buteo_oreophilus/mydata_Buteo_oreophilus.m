function [data, auxData, metaData, txtData, weights] = mydata_Buteo_oreophilus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_oreophilus'; 
metaData.species_en = 'Mountain buzzard'; 

metaData.ecoCode.climate = {'A', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 31.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 50;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'PalmNort1985';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other Buteo species in AnAge';

data.Wwb = 45;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PalmNort1985';
  comment.Wwb = 'egg length 5.38 cm, width  4.25 cm, weight: pi/6*5.38*4.25^2=50.9 g';
data.Wwi = 700;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'hbw';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 1-3 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       45
4.871	57.021
8.032	97.198
11.903	219.176
16.097	255.430
16.806	273.594
17.839	311.229
18.871	344.969
18.872	355.358
19.903	386.500
20.935	381.279
21.774	418.919
21.968	474.758
22.871	459.150
23.903	470.812
24.871	496.761
24.872	492.865
25.839	500.632
26.935	534.370
27.838	539.541
27.839	529.151
28.871	542.111
29.710	536.895
30.871	544.657
31.581	545.937
32.613	548.508
33.903	557.565
34.806	547.152
35.903	549.721
36.097	527.638
36.871	562.683
37.710	557.466
38.935	557.434
39.839	547.021
46.032	609.198
46.097	572.833
49.065	577.951];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PalmNort1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'No data found on sexual dimorphy, which is expected to be little in Buteo';
D3 = 'scaled functional response turned out to vary , which is implented';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'NYVH'; % Cat of Life
metaData.links.id_ITIS = '558955'; % ITIS
metaData.links.id_EoL = '1048454'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_oreophilus'; % Wikipedia
metaData.links.id_ADW = 'Buteo_oreophilus'; % ADW
metaData.links.id_Taxo = '52652'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5BFEFD9AB8F3FD64'; % avibase
metaData.links.id_birdlife = 'mountain-buzzard-buteo-oreophilus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_oreophilus}}';
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
bibkey = 'hbw'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.hbw.com/species/mountain-buzzard-buteo-oreophilus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PalmNort1985'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1985.9639571}, ' ...
'title = {ASPECTS OF THE BIOLOGY OF THE FOREST BUZZARD}, ' ...
'author = {N. G. Palmer and P. M. Norton and A. S. Robertson}, ' ...
'journal = {Ostrich}, ' ...
'year = {1985}, ' ...
'volume = {56}, ' ...
'pages = {67--73}'];
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

