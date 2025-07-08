function [data, auxData, metaData, txtData, weights] = mydata_Centruroides_gracilis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Scorpiones'; 
metaData.family     = 'Buthidae';
metaData.species    = 'Centruroides_gracilis'; 
metaData.species_en = 'Florida bark scorpion'; 

metaData.ecoCode.climate = {'Aw','Cfa'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0jTf'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O','Apf'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri';}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2020 07 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 3.8*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'FranJone1982';   
  temp.am = C2K(26.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.6;   units.Lb  = 'cm';  label.Lb  = 'carapace length at birth';   bibkey.Lb  = 'FranJone1982';
data.Lp  = 6.65;   units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'FranJone1982';
  comment.Lp = 'based on the assumption that allocation to reproduction starts in the second last moult';
data.Li  = 8.16;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'FranJone1982';

data.Wwi = 5.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Smeringurus_mesaensis and the assumption that total length is 2 times carapace length: 8.16/(6.9/2)*2.2';

data.Ri  = 46/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FranJone1982';   
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % instar duration (d), carapace length (cm)
       0 1.60  % hatch
     8.0 2.25  % 1 moult post hatch
    49.0 2.96  % 2 moult
    51.4 3.93  % 3 moult
    58.7 5.21  % 4 moult
    61.8 6.65  % 5 moult
    69.2 8.16  % 6 moult
  1089   8.16];% death  
data.tL_f(:,1) = cumsum(data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(26.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranJone1982';
comment.tL_f = 'Data for females; CL for 1st instar was estimated from photo; duration of last moult ';
%
data.tL_m = [ ... % instar duration (d), carapace length (cm)
       0 1.60  % hatch
     8.0 2.25  % 1 moult post hatch
    49.0 3.01  % 2 moult
    51.4 3.98  % 3 moult
    58.7 5.26  % 4 moult
    61.8 6.85  % 5 moult
    69.2 8.34  % 6 moult
  1089   8.34];% death
data.tL_m(:,1) = cumsum(data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(26.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranJone1982';
comment.tL_m = 'Data for large males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are asummed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Males mature are varying size.moult (6th or 7th and have no post-maturation moults); females at a fixed size/moult (7th)';
metaData.bibkey.F1 = {'FranJone1982','Wiki'};
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'SBTC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52224021'; % Ency of Life
metaData.links.id_Wiki = 'Centruroides_gracilis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '140663'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_scorpion = 'buthidae.php'; % scorpion

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Centruroides_gracilis}}';
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
bibkey = 'FranJone1982'; type = 'Article'; bib = [ ...  
'author = {Francke, O. F. and S. K. Jones}, ' ...
'year = {1982}, ' ...
'title = {The life history of \emph{Centruroides gracilis} ({S}corpiones, {B}uthidae).}, ' ... 
'journal = {J . Arachnol.}, ' ...
'volume = {10}, '...
'pages = {223-239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

