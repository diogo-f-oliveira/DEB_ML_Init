function [data, auxData, metaData, txtData, weights] = mydata_Grosphus_hirtus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Scorpiones'; 
metaData.family     = 'Buthidae';
metaData.species    = 'Grosphus_hirtus'; 
metaData.species_en = 'Scorpion'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri';}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 17];              
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

data.am = 65 * 30.5; units.am = 'd'; label.am = 'life span';                bibkey.am = 'LourGood2006';   
  temp.am = C2K(25.5);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.5;   units.Lb  = 'cm';  label.Lb  = 'carapace length at birth';   bibkey.Lb  = 'LourGood2006';
data.Lp  = 4.3;   units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'LourGood2006';
  comment.Lp = 'based on the assumption that allocation to reproduction starts in the secand last moult';
data.Li  = 6.9;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'LourGood2006';

data.Wwi = 17.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Smeringurus_mesaensis and the assumption that total length is 2 times carapace length: 8*2.2';

data.Ri  = 31/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'LourGood2006';   
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % instar duration (d), carapace length (cm)
     0 1.5
    14 2.0
   112 2.6
   117 3.3
   274 4.3
   334 6.1];
data.tL_f(:,1) = cumsum(data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(25.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LourGood2006';
comment.tL_f = 'LourGood2006 state that units are mm, but this is probably incorrect';
%
data.tL_m = [ ... % instar duration (d), carapace length (cm)
     0 1.4
    14 2.0
   112 2.5
   117 3.2
   274 3.7
   334 4.6];
data.tL_m(:,1) = cumsum(data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(25.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LourGood2006';
comment.tL_m = 'LourGood2006 state that units are mm, but this is probably incorrect';

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

%% Links
metaData.links.id_CoL = '6KRZG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3195162'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5409579'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_scorpion = 'buthidae.php'; % scorpion

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Buthidae}}';
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
bibkey = 'LourGood2006'; type = 'Article'; bib = [ ...  
'author = {Wilson R. Louren\c{c}o and Steven M. Goodman}, ' ...
'year = {2006}, ' ...
'title = {Notes on the postembryonic development and ecology of \emph{Grosphus hirtus} {K}raepelin, 1901 ({S}corpiones, {B}uthidae) from the {P}arc {N}ational d''{A}nkarafantsika, northwest {M}adagascar}, ' ... 
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {244}, '...
'pages = {181-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

