  function [data, auxData, metaData, txtData, weights] = mydata_Retropinna_semoni

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Retropinnidae';
metaData.species    = 'Retropinna_semoni'; 
metaData.species_en = 'Australian smelt';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.am = 3*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.99;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on SL 4.34, see F2';
data.Li = 10;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 0.59;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 5.12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri = 1050/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'MiltArth1985';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
    0 3.29
    1 4.42
    2 5.36];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.87; % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'MiltArth1985'};
comment.tL_f = 'Data for females in upper Moggill Creek during 1981-1982';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
    0 3.18
    1 4.52
    2 5.15];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.87; % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'MiltArth1985'};
comment.tL_m = 'Data for males in upper Moggill Creek during 1981-1982';

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '793XC'; % Cat of Life
metaData.links.id_ITIS = '623386'; % ITIS
metaData.links.id_EoL = '46563103'; % Ency of Life
metaData.links.id_Wiki = 'Retropinna_semoni'; % Wikipedia
metaData.links.id_ADW = 'Retropinna_semoni'; % ADW
metaData.links.id_Taxo = '185846'; % Taxonomicon
metaData.links.id_WoRMS = '282569'; % WoRMS
metaData.links.id_fishbase = 'Retropinna-semoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Retropinna_semoni}}';  
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
bibkey = 'MiltArth1985'; type = 'Article'; bib = [ ...  
'doi = {10.1071/MF9850329}, ' ...
'author = {D. A. Milton and A. H. Arthington}, ' ...
'year = {1985}, ' ...
'title = {Reproductive strategy and growth of the Australian smelt, \emph{Retropinna semoni} {W}eber) ({P}isces : {R}etropinnidae), and the olive perchlet, \emph{Ambassis nigripinnis} ({D}e {V}is) ({P}isces : {A}mbassidae), in {B}risbane, South-eastern {Q}ueensland}, ' ... 
'journal = {J. Mar. Fresw. Res.}, ' ...
'volume = {36}, '...
'pages = {329-341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Retropinna-semoni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
