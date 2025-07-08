function [data, auxData, metaData, txtData, weights] = mydata_Richardsonius_egregius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Richardsonius_egregius'; 
metaData.species_en = 'Lahontan redside'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 03];                           
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

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 6.2;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'Even1969';
  comment.Lp = 'based on first spawning at SL 5.3, see F2';
data.Li = 17;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase'; 
  
data.Wwb = 9e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Bird1975';
  comment.Wwb = 'based on egg diameter of 1-2 mm for Siphateles_bicolor, see F3: pi/6*0.12^3';
data.Wwp = 2.46;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','Even1969'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, F1';
data.Wwi = 57.7;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, F1';

% univariate data
% time-length
data.tL_f = [ ... % time (yr), std length (cm)
    1 3.51
    2 5.24
    3 6.75
    4 7.78];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1));
data.tL_f(:,2) = data.tL_f(:,2)/ 0.85; % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since hatch', 'total length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Even1969'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), std length (cm)
    1 3.33
    2 4.84
    3 6.50
    4 7.33];
data.tL_m(:,1) = 365 * (0.2 + data.tL_m(:,1));
data.tL_m(:,2) = data.tL_m(:,2)/ 0.85; % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since hatch', 'total length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Even1969'; 
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ...
    8.30 1236
    7.95 1695
    7.80 1113
    7.65 1556
    7.55  711
    7.45 1523
    7.30 1371
    7.20 1278
    7.15 1235
    7.10 1096
    7.00  845
    6.85  993
    6.70 1135
    6.45 1091
    5.45  180];
data.LN(:,1) = data.LN(:,1)/ 0.85; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Even1969'; 

% length - weight
data.LWw = [ ... % std length (cm), wet weight (g)
2.727	0.351
2.861	0.329
2.973	0.396
3.041	0.485
3.153	0.575
3.242	0.597
3.309	0.619
3.510	0.641
3.645	0.775
3.735	0.932
3.824	0.954
4.116	1.290
4.183	1.245
4.497	1.760
4.766	1.939
4.947	2.566
5.170	2.364
5.305	2.655
5.530	3.260
5.597	3.238
5.687	3.462
5.823	3.977
5.935	4.201
6.003	4.336
6.092	4.268
6.206	4.896
6.295	4.918
6.408	5.434
6.498	5.434
6.588	5.635
6.655	5.770
6.791	6.128
6.904	6.734
6.993	6.554
7.106	6.913
7.175	7.720
7.356	8.236
7.423	8.101
7.537	9.088
7.558	8.617
7.672	9.334
7.739	9.177
7.894	8.885
7.944	10.523
7.964	9.872
8.099	10.163
8.168	10.702
8.282	11.329
8.353	12.518
8.488	12.989
8.850	14.357];
data.LWw(:,1) = data.LWw(:,1)/ 0.85; % convert SL to TL
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Even1969'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
%weights.Li = 3 * weights.Li;
%weights.Wwb = 5 * weights.Wwb;
%weights.Lp = 5 * weights.Lp;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase';
F3 = 'hybridizes with Siphateles bicolor and Rhinichthys osculus';
metaData.bibkey.F3 = 'Even1969';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3); 

%% Links
metaData.links.id_CoL = '4SZMQ'; % Cat of Life
metaData.links.id_ITIS = '163529'; % ITIS
metaData.links.id_EoL = '47064691'; % Ency of Life
metaData.links.id_Wiki = 'Richardsonius_egregius'; % Wikipedia
metaData.links.id_ADW = 'Richardsonius_egregius'; % ADW
metaData.links.id_Taxo = '186120'; % Taxonomicon
metaData.links.id_WoRMS = '1019697'; % WoRMS
metaData.links.id_fishbase = 'Richardsonius-egregius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Richardsonius_egregius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Richardsonius-egregius.html}}';  
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
bibkey = 'Even1969'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Douglas H. Evens}, ' ...
'year = {1969}, ' ...
'title  = {Life history studies of the {L}ahontan redside, \emph{Richardsonius egregius}, in {L}ake {T}ahoe}, ' ...
'journal = {Calif. Fish and Game}, ' ...
'volume = {55(3)}, ' ...
'pages = {197-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bird1975'; type = 'phdthesis'; bib = [ ...
'author = {Franklin Howard Bird}, ' ...
'year = {1975}, ' ...
'title  = {Biology of the blue and tui chubs in East and Paulina Lakes, Oregon}, ' ...
'school = {Oregon State University}, ' ...
'howpublished = {\url{https://ir.library.oregonstate.edu/concern/graduate_thesis_or_dissertations/dv13zx55n}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
