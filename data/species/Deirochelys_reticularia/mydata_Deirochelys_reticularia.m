function [data, auxData, metaData, txtData, weights] = mydata_Deirochelys_reticularia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Deirochelys_reticularia'; 
metaData.species_en = 'Chicken turtle';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFl'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 159;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '78-89 d in Florida, 152 d in South Carolina at 29 C';
data.tp = 5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '13-18';
data.tpm = 2.3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'BuhlCond2009';
  comment.Lb = '22.3-32.7 mm plastron length';
data.Lp = 17.8; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'ADW';
data.Lpm = 10.2; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty fro males';  bibkey.Lpm = 'ADW';
data.Li = 25.4; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';
data.Lim = 15; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';
  comment.Lim= 'based on "females are 1.5 larger than males": 25.4/1.5';

data.Wwb = 11; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '8.7-13.3 g';
data.Wwi = 2763; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Graptemys_ouachitensis, size has similar size';
 
data.Ri = 8*1.2/365;     units.Ri = '#/d';    label.Ri = 'maximum reproduction rate';   bibkey.Ri = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '1-10 eggs per clutch, 1, sometimes 2 clutches per yr';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.000	3.254
0.000	3.032
0.000	2.587
0.800	5.101
0.945	7.175
0.945	6.878
0.945	5.397
0.982	5.989
0.982	5.693
1.055	6.508
1.891	10.207
1.964	8.503
2.000	9.688
2.000	9.095
2.073	9.243
2.073	8.132
2.109	8.650
2.909	12.942
2.909	11.535
2.909	10.646
2.982	12.423
2.982	12.201
2.982	11.905
3.018	9.016
3.055	10.423
3.964	14.640
3.964	12.937
4.000	13.381
4.036	11.529
4.073	14.343
5.018	15.227
5.055	16.857
5.127	15.449
6.036	17.666
6.036	17.148
6.036	16.777
6.109	16.407
7.018	18.032
7.055	16.920
7.055	17.365
8.073	18.619
8.073	18.396
8.073	17.952
8.073	17.730
8.073	16.767
8.109	17.137
9.018	17.132
9.127	17.946
9.127	18.317
9.127	18.613
10.109	17.423
10.109	17.867
10.109	18.237
11.055	18.084
11.055	18.455
11.091	18.825
11.127	17.269
12.109	18.597
12.109	18.301
12.145	17.116
13.127	17.184
13.127	19.110
13.164	18.740
14.145	18.957
14.182	16.957];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BuhlCond2009';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
0.000	2.868
0.000 	3.330
0.000	2.458
0.909	5.634
0.945	5.839
0.945	5.224
0.982	7.377
0.982	7.070
0.982	6.711
0.982	6.505
0.982	6.300
0.982	6.044
0.982	5.839
0.982	4.916
1.927	6.656
1.927	6.451
1.964	9.117
1.964	8.502
2.000	8.194
2.000	7.989
2.000	7.733
2.000	7.579
2.000	7.425
2.073	7.168
2.909	8.037
2.909	8.447
2.909	8.755
3.018	9.421
3.055	9.011
4.000	10.033
4.000	9.571
4.073	9.366
4.073	8.956
5.018	10.337
5.964	10.333
5.964	10.898
5.964	10.641
6.873	11.510
7.055	10.945
7.964	11.249
7.964	11.403
7.964	11.813
8.000	10.993
8.945	11.861
8.945	12.271
9.964	11.703
9.964	12.011
9.964	13.088
10.036	12.524
10.982	12.777
10.982	12.315
11.018	12.161
11.964	12.722
12.982	12.564
12.982	12.718];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BuhlCond2009';
comment.tL_m = 'Data for females; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '34FDC'; % Cat of Life
metaData.links.id_ITIS = '173786'; % ITIS
metaData.links.id_EoL = '795113'; % Ency of Life
metaData.links.id_Wiki = 'Deirochelys_reticularia'; % Wikipedia
metaData.links.id_ADW = 'Deirochelys_reticularia'; % ADW
metaData.links.id_Taxo = '48618'; % Taxonomicon
metaData.links.id_WoRMS = '1358289'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Deirochelys&species=reticularia'; % ReptileDB
metaData.links.id_AnAge = 'Deirochelys_reticularia'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Deirochelys_reticularia}}';
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
bibkey = 'BuhlCond2009'; type = 'Article'; bib = [ ... 
'author = {Kurt A. Buhlmann and Justin D. Congdon and J. Whitfield Gibbons and Judith L. Greene}, ' ... 
'year = {2009}, ' ...
'title = {ECOLOGY OF CHICKEN TURTLES (\emph{Deirochelys reticularia}) IN A SEASONAL WETLAND ECOSYSTEM: EXPLOITING RESOURCE AND REFUGE ENVIRONMENTS}, ' ...
'journal = {Herpetologica} , ' ...
'volume = {65(1)}, ' ...
'pages = {39-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/795113}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Deirochelys_reticularia/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Graptemys_oculifera}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


