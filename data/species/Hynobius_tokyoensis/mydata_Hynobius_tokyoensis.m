function [data, auxData, metaData, txtData, weights] = mydata_Hynobius_tokyoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Hynobius_tokyoensis'; 
metaData.species_en = 'Tokyo salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 13];

%% set data
% zero-variate data

data.ab = 40;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KusaUeda2006';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KusaUeda2006';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.5;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'guess'; 
data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'KusaUeda2006'; 
data.Li  = 8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'KusaUeda2006';
  comment.Li = 'Spar2014: TL 13 cm, converting to SVL 6.45 cm using F2';

data.Wwb = 1.09e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Spar2014';
  comment.Wwb = 'based on egg diameter of 2.5-3 mm: pi/6*0.275^3';
data.Wwi = 10.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Salamandra salamandra of TL 250 mm, weighing 40 g (Wiki): (16/25)^3*40';

data.Ri  = 192/365;    units.Ri  = '#'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'Spar2014';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15-192 eggs per season';

% univariate data
% time-length
data.tL_Hf = [... % time since birth (yr), SVL (cm)
6.032	6.316
7.111	6.201
8.190	6.774
10.095	7.088
12.127	6.886
13.206	7.000];
data.tL_Hf(:,1) = (data.tL_Hf(:,1) + 0) * 365; % convert yr to d
units.tL_Hf  = {'d', 'cm'}; label.tL_Hf = {'time since birth', 'SVL', 'females'};  
temp.tL_Hf   = C2K(18); units.temp.tL_Hf = 'K'; label.temp.tL_Hf = 'temperature';
bibkey.tL_Hf = 'KusaUeda2006'; comment.tL_Hf = 'females from Kanto plain of Honshu';
%
data.tL_Hm = [... % time since birth (yr), SVL (cm)
3.746	6.160
4.698	6.446
5.778	6.087
6.667	6.502
7.937	6.329
8.762	6.314
9.778	6.730
10.730	6.313
11.873	6.599
12.825	6.799
13.714	7.301
15.810	6.826
16.825	7.112
17.714	6.681
20.762	6.995];
data.tL_Hm(:,1) = (data.tL_Hm(:,1) + 0) * 365; % convert yr to d
units.tL_Hm  = {'d', 'cm'}; label.tL_Hm = {'time since birth', 'SVL', 'males'};  
temp.tL_Hm   = C2K(18); units.temp.tL_Hm = 'K'; label.temp.tL_Hm = 'temperature';
bibkey.tL_Hm = 'KusaUeda2006'; comment.tL_Hm = 'males from Kanto plain of Honshu';
%
data.tL_If = [... % time since birth (yr), SVL (cm)
4.127	6.555
5.143	6.263
5.143	6.263
6.159	6.088
7.111	6.437
8.190	7.295
9.143	6.304];
data.tL_If(:,1) = (data.tL_If(:,1) + 0) * 365; % convert yr to d
units.tL_If  = {'d', 'cm'}; label.tL_If = {'time since birth', 'SVL', 'females'};  
temp.tL_If   = C2K(18); units.temp.tL_If = 'K'; label.temp.tL_If = 'temperature';
bibkey.tL_If = 'KusaUeda2006'; comment.tL_If = 'females from Isumi, Chiba prefecture';
%
data.tL_Im = [... % time since birth (yr), SVL (cm)
3.810	6.250
4.825	6.263
5.841	6.336
6.794	6.044
7.810	7.222
8.762	6.392
9.714	7.483
10.730	8.036
12.825	7.117];
data.tL_Im(:,1) = (data.tL_Im(:,1) + 0) * 365; % convert yr to d
units.tL_Im  = {'d', 'cm'}; label.tL_Im = {'time since birth', 'SVL', 'males'};  
temp.tL_Im   = C2K(18); units.temp.tL_Im = 'K'; label.temp.tL_Im = 'temperature';
bibkey.tL_Im = 'KusaUeda2006'; comment.tL_Im = 'males from Isumi, Chiba prefecture';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Hf = 3 * weights.tL_Hf;
weights.tL_Hm = 3 * weights.tL_Hm;
weights.tL_If = 3 * weights.tL_If;
weights.tL_Im = 3 * weights.tL_Im;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Hf','tL_Hm'}; subtitle1 = {'Data for females, males from Habu'};
set2 = {'tL_If','tL_Im'}; subtitle2 = {'Data for females, males from Isumi'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Only known from the mountain system of Junggarian Alatau in Southern Kazakhstan and North-Western Xinjiang';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'SVL = TL*0.496, based on photo';
metaData.bibkey.F2 = 'diving'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N2KR'; % Cat of Life
metaData.links.id_ITIS = '668224'; % ITIS
metaData.links.id_EoL = '1019564'; % Ency of Life
metaData.links.id_Wiki = 'Hynobius_tokyoensis'; % Wikipedia
metaData.links.id_ADW = 'Hynobius_tokyoensis'; % ADW
metaData.links.id_Taxo = '138787'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hynobius+tokyoensis'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hynobius_tokyoensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'diving'; type = 'Misc'; bib = ...
'howpublished = {\url{http://diving.tank.jp/sports/fish/etc/a2_ryosei/y02_tokyosansyouoo.htm}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Max Sparreboom}, ' ...
'year = {2014}, ' ...
'title  = {Salamanders of the Old World}, ' ...
'publisher = {KNNV publishing, Zeist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KusaUeda2006'; type = 'Article'; bib = [ ... 
'doi = {10.3105/1345-5834(2006)25[71:BSAASO]2.0.CO;2}, ' ...
'author = {Tamotsu Kusano and Takehito Ueda and Hikaru Nakagawa}, ' ... 
'year = {2006}, ' ...
'title = {Body Size and Age Structure of Breeding Populations of the Salamander, \emph{Hynobius tokyoensis} ({C}audata: {H}ynobiidae)}, ' ...
'journal = {Current Herpetology}, ' ...
'volume = {25(2)}, ' ...
'pages = {71-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hynobius+tokyoensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

