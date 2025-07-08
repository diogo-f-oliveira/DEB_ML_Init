function [data, auxData, metaData, txtData, weights] = mydata_Typhlonarke_aysoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Torpediniformes'; 
metaData.family     = 'Narkidae';
metaData.species    = 'Typhlonarke_aysoni'; 
metaData.species_en = 'Blind electric ray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 19]; 

%% set data
% zero-variate data;
data.ab = 1.8*365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v is around 0.03; included to check litter interval';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMaol2018';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 10.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'FranMaol2018';
data.Lp = 21.2;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranMaol2018';
data.Lpm = 19.9; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranMaol2018';
data.Li  = 44.6;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'FranMaol2018';

data.Wwi  = 1.4e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','FranMaol2018'};
  comment.Wwi = 'based on 0.01820*Li^2.96, see F3';

data.Ri  = 9/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FranMaol2018';   
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9 pups per litter, 1 litter each 2 yrs is guessed in view of ab';  
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	10.120
2.040	22.330
4.031	25.422
4.057	24.019
4.524	27.122
7.555	34.515
9.573	37.106
10.607	35.395
13.114	36.479];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranMaol2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.000	10.220
1.000	17.929
2.095	23.232
4.032	25.623
5.043	28.722
5.096	27.419
6.549	35.925
7.557	35.918
8.518	43.025
8.619	36.011
9.632	41.013];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranMaol2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'males are assumed to differ from females by  E_Hp only';
D2 = 'no information about weights could be found';
D3 = 'mean temperatures are guessed';
D4 = 'ab is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'bathydemersal; depth range 300 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight for Tetronarce nobiliana: Ww in g  = 0.01820 * (TL in cm)^2.96';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'length-length: pelvic length PL = 0.73 * TL';
metaData.bibkey.F4 = 'FranMaol2018'; 
metaData.facts = struct('F1',F1,'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '59WWB'; % Cat of Life
metaData.links.id_ITIS = '564470'; % ITIS
metaData.links.id_EoL = '46560447'; % Ency of Life
metaData.links.id_Wiki = 'Typhlonarke_aysoni'; % Wikipedia
metaData.links.id_ADW = 'Typhlonarke_aysoni'; % ADW
metaData.links.id_Taxo = '189688'; % Taxonomicon
metaData.links.id_WoRMS = '283076'; % WoRMS
metaData.links.id_fishbase = 'Typhlonarke-aysoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Typhlonarke_aysoni}}';  
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
bibkey = 'FranMaol2018'; type = 'techreport'; bib = [ ... 
'isbn = {ISBN 978-1-77665-767-4}, ' ...
'author = {M. P . Francis and C. \''{O}. Maolag\''{a}in and W. S. Lyon}, ' ...
'year = {2018}, ' ...
'title  = {Growth and reproduction of carpet shark, common electric ray and blind electric ray in {N}ew {Z}ealand waters}, ' ...
'series = {New Zealand Aquatic Environment and Biodiversity}, ' ...
'volume = {195}, ' ...
'institution = {Ministry for Primary Industries, PO Box 2526, WELLINGTON 6140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Typhlonarke-aysoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

