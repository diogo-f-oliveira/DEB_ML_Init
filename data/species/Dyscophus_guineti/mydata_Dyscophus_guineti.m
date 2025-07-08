function [data, auxData, metaData, txtData, weights] = mydata_Dyscophus_guineti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Microhylidae';
metaData.species    = 'Dyscophus_guineti'; 
metaData.species_en = 'False tomato frog'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.tj = 45; units.tj = 'd';    label.tj = 'time since birth at metam';            bibkey.tj = 'Wiki';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'value for Dyscophus_antongilii';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'TessGuar2011';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 9.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';                    bibkey.Lp  = 'TessGuar2011';
  comment.Lp = 'based on tp = 5 yr and tL_f data';
data.Lpm  = 6.4;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty';                    bibkey.Lpm  = 'TessGuar2011';
  comment.Lpm = 'based on tp = 4 yr and tL_m data';
data.Li  = 11.24;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'TessGuar2011';
  comment.Li = '66.8 to 112.4 mm';
data.Lim  = 7.81; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'TessGuar2011';
  comment.Lim = '61.3 to 7.81 mm';

data.Wwb = 1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Hyla exima';
data.Wwp = 82.5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'TessGuar2011';
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 145.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'TessGuar2011';
data.Wwim = 80.2; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'TessGuar2011';

data.Ri  = 1500/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Dyscophus_antongilii';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
2.98173	6.45812
2.99816	9.59767
3.90516	8.54286
3.92616	6.78410
3.92708	7.40821
4.94558	9.94731
4.95690	9.62585
4.97015	10.60936
4.98787	6.61890
6.00798	10.25493
6.02048	10.72780
6.94170	11.31845];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TessGuar2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
2.95389	3.58328
3.88996	6.23546
3.89018	6.38676
3.90217	6.51921
3.91456	6.91643
3.91489	7.14338
3.92145	3.58785
3.92971	9.18600
4.95157	6.01353
4.97676	7.09166
4.98898	7.37541
5.89682	6.88797
5.90892	7.09607
5.92103	7.30417];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TessGuar2011';
comment.tL_m = 'data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '388VP'; % Cat of Life
metaData.links.id_ITIS = '664382'; % ITIS
metaData.links.id_EoL = '333039'; % Ency of Life
metaData.links.id_Wiki = 'Dyscophus_guineti'; % Wikipedia
metaData.links.id_ADW = 'Dyscophus_guineti'; % ADW
metaData.links.id_Taxo = '142311'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Dyscophus+guineti'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dyscophus_guineti}}';
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
bibkey = 'TessGuar2011'; type = 'Article'; bib = [ ... 
'author = {Giulia Tessa and Fabio M. Guarino and Jasmin E. Randrianirina and Franco Andreone}, ' ... 
'year = {2011}, ' ...
'title = {Age structure in the false tomato frog \emph{Dyscophus guineti} from eastern {M}adagascar compared to the closely related \emph{D. antongilii} ({A}nura, {M}icrohylidae)}, ' ...
'journal = {African Journal of Herpetology}, ' ...
'volume = {60(1)}, ' ...
'pages = {84-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Dyscophus+guineti}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
