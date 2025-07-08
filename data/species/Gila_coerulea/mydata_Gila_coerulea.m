function [data, auxData, metaData, txtData, weights] = mydata_Gila_coerulea
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_coerulea'; 
metaData.species_en = 'Blue chub'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 02];                           
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

data.ab = 168/24;   units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'Bird1975';   
  temp.ab = C2K(14.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                   bibkey.am = 'Bird1975';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'Bird1975';
data.Li = 41;    units.Li = 'cm'; label.Li = 'ultimate total length';          bibkey.Li = 'fishbase'; 
  
data.Wwb = 4.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Bird1975';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 9.34;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','Bird1975'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, F1';
data.Wwi = 908;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, F1';
       
% univariate data
 
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
-0.044	1.871
1.002	3.010
2.005	6.117
3.032	11.648
4.011	13.520
4.989	14.110
5.991	16.530
6.924	18.219
6.992	18.356
7.948	19.815
8.996	22.510
9.974	23.420];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));
data.tL_f(:,2) = data.tL_f(:,2)/0.93; % convert FL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since hatch', 'total length', 'female'};  
temp.tL_f = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bird1975'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), total length (cm)
-0.044	1.871
1.002	3.010
1.937	6.072
3.008	9.818
3.987	11.873
5.011	13.698
5.944	15.295
6.968	17.075];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));
data.tL_m(:,2) = data.tL_m(:,2)/0.93; % convert FL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since hatch', 'total length', 'male'};  
temp.tL_m = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bird1975'; 
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
10.350	5806.451
12.233	3820.034
13.003	7181.663
13.259	8658.743
15.523	9779.286
16.046	7538.199
16.096	14363.327
17.086	6010.186
17.089	4482.173
17.510	19456.705
18.161	18081.494
19.125	21188.455
19.402	13191.849
20.667	26893.039
21.712	23225.806
22.088	28777.589
22.171	20322.581
22.756	19252.971];
data.LN(:,1) = data.LN(:,1)/0.93; % convert FL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Bird1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

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

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3G2FZ'; % Cat of Life
metaData.links.id_ITIS = '163548'; % ITIS
metaData.links.id_EoL = '994804'; % Ency of Life
metaData.links.id_Wiki = 'Gila_coerulea'; % Wikipedia
metaData.links.id_ADW = 'Gila_coerulea'; % ADW
metaData.links.id_Taxo = '174934'; % Taxonomicon
metaData.links.id_WoRMS = '1419418'; % WoRMS
metaData.links.id_fishbase = 'Gila-coerulea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gila_coerulea}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gila-coerulea.html}}';  
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
bibkey = 'Bird1975'; type = 'phdthesis'; bib = [ ...
'author = {Franklin Howard Bird}, ' ...
'year = {1975}, ' ...
'title  = {Biology of the blue and tui chubs in East and Paulina Lakes, Oregon}, ' ...
'school = {Oregon State University}, ' ...
'howpublished = {\url{https://ir.library.oregonstate.edu/concern/graduate_thesis_or_dissertations/dv13zx55n}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
