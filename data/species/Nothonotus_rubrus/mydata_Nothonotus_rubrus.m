  function [data, auxData, metaData, txtData, weights] = mydata_Nothonotus_rubrus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Nothonotus_rubrus'; 
metaData.species_en = 'Bayou darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
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
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.56;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'KnigRoss1992'; 
data.Li = 4.8;    units.Li = 'cm'; label.Li = 'ultimate standard length';             bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 5.5 cm, converted to SL using F2';

data.Wwb = 1.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwi = 1.1; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = {'fishbase','IrwiFolt2012'};
   comment.Wwi = 'relationship 0.00513*5.5^3.14 (see F1)';

data.GSI = 0.15;   units.GSI = '-';  label.GSI = 'gonado somatic index';           bibkey.GSI = 'KnigRoss1992';
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
    1 2.88
    2 3.59
    3 4.09];
data.tL_f(:,1) = 365 * (.0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KnigRoss1992';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
    1 3.22
    2 3.79
    3 4.25];
data.tL_m(:,1) = 365 * (.0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KnigRoss1992';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

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
F2 = 'length-length: TL = 1.15 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6GST4'; % Cat of Life
metaData.links.id_ITIS = '1149007'; % ITIS
metaData.links.id_EoL = '207266'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_rubrum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_rubrum'; % ADW
metaData.links.id_Taxo = '174143'; % Taxonomicon
metaData.links.id_fishbase = 'Etheostoma-rubrum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_rubrum}}';  
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
bibkey = 'KnigRoss1992'; type = 'article'; bib = [ ...  
'author = {Jeremey G. Knight and Stephen T. Ross}, ' ...
'year = {1992}, ' ...
'title = {Reproduction, Age and Growth of the {B}ayou Darter \emph{Etheostoma rubrum} ({P}isces, {P}ercidae): {A}n Endemic of {B}ayou {P}ierre}, ' ... 
'journal = {Am. Midl. Nat.}, ' ...
'volume = {127}, '...
'pages = {91-105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IrwiFolt2012'; type = 'article'; bib = [ ...  
'author = {Stephan W. Irwin and Jeffrey W. Foltz}, ' ...
'year = {2012}, ' ...
'title = {Reproductive Characteristics of the Turquoise Darter (\emph{Etheostoma inscriptum}) in the Upper {P}iedmont of {S}outh {C}arolina}, ' ... 
'journal = {Copeia 2012}, ' ...
'volume = {2012(2)}, '...
'pages = {237-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-rubrum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
