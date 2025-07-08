  function [data, auxData, metaData, txtData, weights] = mydata_Ambassis_agassizii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Ambassidae';
metaData.species    = 'Ambassis_agassizii'; 
metaData.species_en = 'Olive perchlet';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFe', '0iFl', '0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data
data.am = 4*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.9;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on SL 3.72 cm, see F2';
data.Li = 9.9;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 7.5 cm, see F2';

data.Wwb = 1.8e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 1.61;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01349*Lp^3.01, see F1';
data.Wwi = 13.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.01, see F1';

data.Ri = 740/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'MiltArth1985';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time - length
data.tL_f = [ ... % time since birth (yr), std length (cm)
    0 2.55
    1 3.68
    2 4.75
    3 5.26];
data.tL_f(:,1) = (1 + data.tL_f(:,1)) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.76; % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'MiltArth1985'};
comment.tL_f = 'Data for females in Brisbane River during 1981-1982';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
    0 2.58
    1 3.75
    2 4.71];
data.tL_m(:,1) = (1 + data.tL_m(:,1)) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.76; % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'MiltArth1985'};
comment.tL_m = 'Data for males in Brisbane River during 1981-1982';

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
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.76 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = 'CKQN'; % Cat of Life
metaData.links.id_ITIS = '645539'; % ITIS
metaData.links.id_EoL = '209917'; % Ency of Life
metaData.links.id_Wiki = 'Ambassis_agassizii'; % Wikipedia
metaData.links.id_ADW = 'Ambassis_agassizii'; % ADW
metaData.links.id_Taxo = '654695'; % Taxonomicon
metaData.links.id_WoRMS = '991181'; % WoRMS
metaData.links.id_fishbase = 'Ambassis-agassizii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ambassis_agassizii}}';  
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
'howpublished = {\url{http://www.fishbase.org/summary/Ambassis-agassizii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
