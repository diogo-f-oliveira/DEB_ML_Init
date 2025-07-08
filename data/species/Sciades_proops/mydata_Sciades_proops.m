function [data, auxData, metaData, txtData, weights] = mydata_Sciades_proops
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Sciades_proops'; 
metaData.species_en = 'Crucifix sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 02];

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36.6;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AzevCast2010';
  comment.Lp = 'LecoMeun1989 give SL 51 cm';
data.Li  = 100;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 2.14; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase'; 
  comment.Wwb = 'based on egg diameter of 16 mm as typical for Sciades: pi/6*1.6^3';
data.Wwp  = 545; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00603*Lp^3.17, see F1';
data.Wwi  = 9e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'max published weight; based on 0.00603*Li^3.17, see F1, give 1.3 kg';

data.GSI = 0.15; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(27.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.969	35.315
1.462	51.832
1.974	59.136
2.472	63.518
2.999	65.505
3.510	66.517];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % conver yr to d
data.tL_f(:,2) = data.tL_f(:,2)/0.9; % convert SL to TL
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LecoMeun1989';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.980	34.417
1.979	55.316];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % conver yr to d
data.tL_m(:,2) = data.tL_m(:,2)/0.9; % convert SL to TL
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LecoMeun1989';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00603*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.9*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4VGX8'; % Cat of Life
metaData.links.id_ITIS = '680785'; % ITIS
metaData.links.id_EoL = '46582118'; % Ency of Life
metaData.links.id_Wiki = 'Sciades_proops'; % Wikipedia
metaData.links.id_ADW = 'Sciades_proops'; % ADW
metaData.links.id_Taxo = '3420303'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Sciades-proops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sciades_proops}}';
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
bibkey = 'LecoMeun1989'; type = 'Article'; bib = [ ... 
'author = {Fr\''{e}d\''{e}rique Lecomte and Fran\c{c}ois J. Meunier and Ricardo Rojas-Beltran},'...
'title = {Some data on the growth of \emph{Arius proops} ({A}riidae, {S}iluriforme) in the estuaries of {F}rench {G}uyana},'...
'journal = {Aquat. Living Resour.}, '...
'volume = {2}, '...
'year = {1989}, '...
'pages = {63-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AzevCast2010'; type = 'Article'; bib = [ ... 
'author = {James Werllen de Jesus Azevedo and Antonio Carlos Leal de Castro and Heliene Leite Ribeiro Porto and Paulo Roberto Sousa Lima},'...
'title = {SIZE AND AGE AT FIRST MATURITY OF THE CRUCIFIX SEA CATFISH, \emph{Sciades proops} ({V}ALENCIENNES, 1840) ({S}ILURIFORMES: {A}RIIDAE), CAUGHT OFF WESTERN {M}ARANH\~{a}O {S}TATE, {B}RAZIL},'...
'journal = {Arq. Ci\^{e}n. Mar, Fortaleza}, '...
'volume = {43(2)}, '...
'year = {2010}, '...
'pages = {96-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sciades-proops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

