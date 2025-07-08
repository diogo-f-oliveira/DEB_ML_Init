  function [data, auxData, metaData, txtData, weights] = mydata_Salminus_brasiliensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Bryconidae';
metaData.species    = 'Salminus_brasiliensis'; 
metaData.species_en = 'Dourado'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjPz','jiCi','jiCv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2020 05 01];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 15*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'Wiki';
data.Li = 103;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*.2^3';
data.Wwi = 34e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'Wiki';
data.Wwim = 25e3;  units.Wwim = 'g';    label.Wwim = 'max wet weight for males';    bibkey.Wwim = 'guess';
  comment.Wwim = 'based on remark that males are considerably smaller than females';
  
data.Ri = 2e6/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL_f = [ ... % time since birth (yr), standard length (cm)
    1  16.8
    2  22.0
    3  25.0
    4  31.5
    5  34.5
    6  45.7
    7  46.3
    8  53.8
    9  55.5
    10 56.6
    11 61.0
    12 65.0
    15 72.0];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZuliAmbr2016';
comment.tL_f = 'Data for females; temperature is guessed';
% males
data.tL_m = [ ... % time since birth (yr), standard length (cm)
    1  17.2
    2  21.0
    3  23.0
    4  33.0
    5  52.8
    6  53.2
    7  56.1
    8  60.0
    9  61.0
    10 64.1
    11 65.4
    12 67.5];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZuliAmbr2016';
comment.tL_m = 'Data for males; temperature is guessed';
  
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'females are bigger than males';
metaData.bibkey.F1    = 'Wiki';
F2 = 'prefers water temperatures between 20 and 25 C';
metaData.bibkey.F2    = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '79D93'; % Cat of Life
metaData.links.id_ITIS = '641697'; % ITIS
metaData.links.id_EoL = '215413'; % Ency of Life
metaData.links.id_Wiki = 'Salminus_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Salminus_brasiliensis'; % ADW
metaData.links.id_Taxo = '186406'; % Taxonomicon
metaData.links.id_WoRMS = '1016624'; % WoRMS
metaData.links.id_fishbase = 'Salminus-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salminus_brasiliensis}}';  
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
bibkey = 'ZuliAmbr2016'; type = 'Article'; bib = [ ...  
'author = {Marina Soares Zuliani and Angela Maria Ambr\''{o}sio and Talitha Mayumi Francisco and Thiago Jos\''{e} Balbi and Edson Kiyoshi Okada and Luiz Carlos Gomes}, ' ...
'year  = {2016}, ' ...
'title = {Age and growth parameters of the dourado \emph{Salminus brasiliensis} ({C}uvier, 1816) from the river {C}uiab\''{a}, {M}ato {G}rosso {S}tate, {B}razil}, ' ...  
'doi = {10.3750/AIEP/02346}, ' ...
'journal = {Acta Scientiarum. Biological Sciences}, ' ...
'volume = {38}, ' ...
'pages = {89-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Salminus-brasiliensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

