function [data, auxData, metaData, txtData, weights] = mydata_Galeocerdo_cuvier

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Galeocerdo_cuvier'; 
metaData.species_en = 'Tiger shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCvr', 'biCva', 'biCvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 08];


%% set data
% zero-variate data

data.ab = 16.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ADW';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15 till 18 months';
data.tp = 7 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'NataCase1999';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'NataCase1999';
  temp.tpm = C2K(26); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27.3*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'NataCase1999';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge gives 25; Wiki 29 yr for males, 32 yr for females';

data.Lb  = 62;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki'; 
  comment.Lb = ' 51 to 76  cm; TL 62 cm corresponds with 51 cm FL, see F3';
data.Lp  = 300;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 250; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Wiki'; 
data.Li  = 550;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'MeyeOMal2014';
data.Lim  = 428; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'MeyeOMal2014';

data.Wwb = 929;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwi = 'computed as 2.528e-3 * (62 * 203/ 247)^3.26, see F3';
data.Wwp = 159e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'Wiki';
  comment.Wwi = 'computed as 2.528e-3 * (300 * 203/ 247)^3.26, see F3';
data.Wwpm = 87.5e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'Wiki';
  comment.Wwi = 'computed as 2.528e-3 * (250 * 203/ 247)^3.26, see F3';
data.Wwi = 1144e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MeyeOMal2014';
  comment.Wwi = 'computed as 2.528e-3 * (550 * 203/ 247)^3.26, see F3';
data.Wwim = 505e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'MeyeOMal2014';
  comment.Wwim = 'computed as 2.528e-3 * (428 * 203/ 247)^3.26, see F3';
 
data.Ri  = 15/365/3;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 till 18 pups per litter every 3 yr';

 % uni-variate data
 
% t-dL data 
data.LdL_f = [ ... % fork length (cm), change in fork length (cm/yr)
 76.0 33.1
 77.0 52.3
 78.7 25.1
 79.0 32.5
 86.0 53.0
 88.0 32.8
 89.0 34.0
 90.0 70.9
 91.0 24.5
 91.0 24.5
 94.0 41.2
 96.0 38.1
 98.0 37.0
 98.0 29.6
102.0 57.9
104.0 22.1
109.0 52.6
110.0 59.6
114.0 26.2
117.0 30.5
117.5 34.3
124.0 35.7
149.0 16.2
190.0  8.5
281.0  5.8
104.0 39.4
100.0 48.7];
data.LdL_f = data.LdL_f * 247/ 203; % convert fork to total length
data.LdL_f(:,2) = data.LdL_f(:,2)/ 365; % convert yr to d
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'total length', 'change in total length', 'female'};  
temp.LdL_f    = C2K(26);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f  = 'NataCase1999';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % fork length (cm), change in fork length (cm/yr)
 75.9 36.5
 76.2 21.0
 85.0 46.6
 91.0 30.0
 91.0 37.7
 97.0 49.5
 98.0 45.4
106.0 50.4
106.0 54.2
108.0 28.4
111.0 47.9
118.0 37.7
120.0 31.8
121.0 43.9
124.0 14.2
170.0 20.3
287.0  9.2
 70.5 42.3];
data.LdL_m = data.LdL_m * 247/ 203; % convert fork to total length
data.LdL_m(:,2) = data.LdL_m(:,2)/ 365; % convert yr to d
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'total length', 'change in total length', 'male'};  
temp.LdL_m    = C2K(26);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m  = 'NataCase1999';
comment.LdL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity), with embryos feeding on other ova produced by the mother (oophagy) after the yolk sac is absorbed';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 26 C, usually 0 - 800 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'FL 203 cm = TL 247 cm; Ww (in g) = 2.528e-3 * (FL in cm)^3.26';
metaData.bibkey.F3 = 'KohlCase1996'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3F3KT'; % Cat of Life
metaData.links.id_ITIS = '160189'; % ITIS
metaData.links.id_EoL = '46559811'; % Ency of Life
metaData.links.id_Wiki = 'Galeocerdo_cuvier'; % Wikipedia
metaData.links.id_ADW = 'Galeocerdo_cuvier'; % ADW
metaData.links.id_Taxo = '41989'; % Taxonomicon
metaData.links.id_WoRMS = '105799'; % WoRMS
metaData.links.id_fishbase = 'Galeocerdo-cuvier'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galeocerdo_cuvier}}';
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
bibkey = 'NataCase1999'; type = 'Article'; bib = [ ... 
'author = {Natanson, L. J. and Casey, J. G. and Kohler, N. E. and Colket IV, T.}, ' ... 
'year = {1999}, ' ...
'title = {Growth of the tiger shark, \emph{Galeocardo cuvier}, in the western {N}orth {A}tlantic based on tag returns and length frequencies; and a note on the effects of tagging}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {944-953}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KohlCase1996'; type = 'Techreport'; bib = [ ... 
'author = {N. E. Kohler and J. G. Casey and P. A. Turner}, ' ... 
'year = {1996}, ' ...
'title = {Length-Length and Length-Weight Relationships for 13 Shark Species from the {W}estern {N}orth {A}tlantic}, ' ...
'institution = {NOAA Technical Memorandum}, ' ...
'volume = {NMFS-NE-110}, ' ...
'howpublished = {\url{https://www.nefsc.noaa.gov/publications/tm/tm110/tm110.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeyeOMal2014'; type = 'Article'; bib = [ ... 
'author = {C. G. Meyer and J. M. O''Malley and Y. P. Papastamatiou and J. J. Dale and M. R. Hutchinson and J. M. Anderson and M. A. Royer and K. N. Holland}, ' ... 
'year = {2014}, ' ...
'title = {Growth and Maximum Size of Tiger Sharks (\emph{Galeocerdo cuvier}) in {H}awaii}, ' ...
'journal = {PLoS ONE}, ' ...
'doi = {doi:10.1371/journal.pone.0084799}, ' ...
'volume = {9}, ' ...
'number = {1}, ' ...
'pages = {e84799}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Isurus-oxyrinchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Galeocerdo-cuvier/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Galeocerdo_cuvier}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

