  function [data, auxData, metaData, txtData, weights] = mydata_Pseudochondrostoma_polylepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pseudochondrostoma_polylepis'; 
metaData.species_en = 'Iberian nase'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                        bibkey.am = 'guess';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 8.7;  units.Lp = 'cm'; label.Lp = 'fork length at puberty for females';   bibkey.Lp = 'HerrFern1994'; 
data.Lpm = 7.6;  units.Lpm = 'cm'; label.Lpm = 'fork length  at puberty for males'; bibkey.Lpm = 'HerrFern1994'; 
data.Li = 0.926*40;    units.Li = 'cm'; label.Li = 'ultimate fork length';          bibkey.Li = 'fishbase';
  comment.Li = 'total length converted to fork length, using F2';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'HerrFern1994';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 8.4;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';             bibkey.Wwp = {'HerrFern1994','fishbase'};
  comment.Wwp = 'based on 0.00776*(Lp/0.926)^3.12, see F1, F2';
data.Wwi = 773;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*(Li/0.926)^3.12, see F1, F2';

data.Ri = 5.1e4/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max rate';           bibkey.Ri = 'guess';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chondrostoma nasus with ultimate size-correction: (40/50)^3*Ri';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  4.7
    2  8.1
    3 11.3
    4 13.9
    5 15.9
    6 16.7
    7 19.6];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length', 'mix, Guadalquivir River'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HerrFern1994';
comment.tL = 'Guadalquivir River';
%
data.tL1 = [ ... % time since birth (yr), fork length (cm)
    1 12.1
    2 19.4
    3 25.0
    4 27.5
    5 30.1
    6 32.5
    7 34.1];
data.tL1(:,1) = 365 * (0.5 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'fork length', 'mix, pop b'};  
temp.tL1 = C2K(17);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'HerrFern1994';
comment.tL1 = 'Granado et al 1985, population b';
%
data.tL_f = [ ... % time since birth (yr), fork length (cm)
    1  5.4
    2 10.6
    3 14.6
    4 18.0
    5 21.0
    6 22.8
    7 24.1];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HerrFern1994';
comment.tL_f = 'data for females, Lobon-Cervia & Elvira 1981';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
    1  5.3
    2 10.3
    3 15.0
    4 17.6
    5 19.3
    6 21.3
    7 23.4];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HerrFern1994';
comment.tL_m = 'data for males, Lobon-Cervia & Elvira 1981';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL', 'tL_m', 'tL1'}; subtitle1 = {'Data for females, mix, males, mix'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'fork-total length FL = 0.926*TL, based on photo';
metaData.bibkey.F2 = 'ittiofauna'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4NTH7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '218477'; % Ency of Life
metaData.links.id_Wiki = 'Pseudochondrostoma_polylepis'; % Wikipedia
metaData.links.id_ADW = 'Pseudochondrostoma_polylepis'; % ADW
metaData.links.id_Taxo = '1008263'; % Taxonomicon
metaData.links.id_WoRMS = '1021053'; % WoRMS
metaData.links.id_fishbase = 'Pseudochondrostoma-polylepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudochondrostoma_polylepis}}';  
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
bibkey = 'HerrFern1994'; type = 'Article'; bib = [ ...  
'author = {M. Herrera and C. Fern\''{a}ndez-Delgado}, ' ...
'year = {1994}, ' ...
'title = {The age, growth and reproduction of \emph{Chondrostoma polylepis willkommi} in a seasonal stream in the {G}uadalquivir {R}iver basin (southern {S}pain)}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {44}, '...
'pages = {11-22}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pseudochondrostoma-polylepis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ittiofauna'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ittiofauna.org/webmuseum/pesciossei/cypriniformes/cyprinidae/pseudochondrostoma/pseudochondrostoma_polylepis/p_polylepis_big_1.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

