  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_coosae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_coosae'; 
metaData.species_en = 'Coosa darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
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
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'ONeiDraw1981'; 
  comment.Lp = 'based on tp 1 yr and tL data';
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ONeiDraw1981';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 2.52; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

data.Ri = 496/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'ONeiDraw1981';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time (yr), std length (cm)
0	2.806
1	3.680
2	4.075];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.87; % convert SL to TL 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ONeiDraw1981';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), std length (cm)
0	3.004
1	4.120
2	4.323];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.87; % convert SL to TL 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ONeiDraw1981';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  30 * weights.tL_f;
weights.tL_m =  30 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v =  2 * weights.psd.v;
%weights.psd.p_M =  3 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL38'; % Cat of Life
metaData.links.id_ITIS = '168385'; % ITIS
metaData.links.id_EoL = '994972'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_coosae'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_coosae'; % ADW
metaData.links.id_Taxo = '174084'; % Taxonomicon
metaData.links.id_WoRMS = '1525051'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-coosae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_coosae}}';  
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
bibkey = 'ONeiDraw1981'; type = 'article'; bib = [ ...  
'author = {Patrick O''Neil and P. O. Drawer}, ' ...
'year = {1981}, ' ...
'title = {Life History of  \emph{Etheostoma coosae} (Pisces, {P}ercidae) in {B}arraree {C}reek, {A}labama}, ' ... 
'journal = {Tulane Studies in Zoology and Botany}, ' ...
'volume = {23(1)}, '...
'pages = {75-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-coosae}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
