  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_cragini
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_cragini'; 
metaData.species_en = 'Arkansas darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.8;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'TabeTabe1986'; 
data.Li = 5.2;    units.Li = 'cm'; label.Li = 'ultimate standard length';             bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 6 cm, converted to SL using F2';

data.Wwb = 1.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwi = 2.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'TabeTabe1986';

data.GSI = 0.15;   units.GSI = '-';  label.GSI = 'gonado somatic index';           bibkey.GSI = 'TabeTabe1986';
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
    1 3.56
    2 4.94
    3 5.73];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TabeTabe1986';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
    1 3.29
    2 4.73
    3 5.30];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TabeTabe1986';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length: TL = 1.15 * SL';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GSSY'; % Cat of Life
metaData.links.id_ITIS = '168386'; % ITIS
metaData.links.id_EoL = '207236'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_cragini'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_cragini'; % ADW
metaData.links.id_Taxo = '174086'; % Taxonomicon
metaData.links.id_WoRMS = '1019837'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-cragini'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_cragini}}';  
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
bibkey = 'TabeTabe1986'; type = 'article'; bib = [ ...  
'author = {Charles A. Taber and Barbara A. Taber and Milton S. Topping}, ' ...
'year = {1986}, ' ...
'title = {POPULATION STRUCTURE, GROWTH AND REPRODUCTION OF THE {A}RKANSAS DARTER, \emph{Etheostoma cragini}({P}ERCIDAE)}, ' ... 
'journal = {The Southwestern Naturalist}, ' ...
'volume = {31(2)}, '...
'pages = {207-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-rubrum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
