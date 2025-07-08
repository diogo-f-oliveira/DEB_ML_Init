function [data, auxData, metaData, txtData, weights] = mydata_Siphateles_bicolor

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Siphateles_bicolor'; % previously Gila bicolor
metaData.species_en = 'Tui Chub'; 

metaData.ecoCode.climate = {'BSk','Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine','Bas Kooijman'};                             
metaData.date_subm = [2020 06 28];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.ah = 4;   units.ah = 'd';  label.ah = 'age at hatch';  bibkey.ah = 'ArchBona2009';   
  temp.ah = C2K(22); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 168/24;   units.ab = 'd';  label.ab = 'age at birth';                      bibkey.ab = 'Bird1975';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty (females)';  bibkey.tp = 'fwspubs';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
    comment.tp = 'temp is guessed';
data.tpm = 1 * 365;   units.tpm = 'd';  label.tpm = 'time since birth at puberty (males)';  bibkey.tpm = 'fwspubs';   
  temp.tpm = C2K(13); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'temp is guessed';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fwspubs';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guessed, report says several years';
  
data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'Bird1975';
data.Li = 45;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'Wiki';

data.Wwb = 9e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Bird1975';
  comment.Wwb = 'based on egg diameter of 1-2 mm: pi/6*0.12^3';
data.Wwi = 1.25e3;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = 'fishbase';
   comment.Wwi = '0.00871 * Li^3.12, see F3';

data.Ri = 68933/365; units.Ri = '#/d';  label.Ri = 'ultimate reprod rate';       bibkey.Ri = 'Kuce1978';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'table, 2, eggs for 37.8cm female - temp is guessed';
  
% univariate data
 
% time-length
data.tL_f = [ ... % time (yr), fork length (cm)
0.000	1.941
0.992	4.019
2.006	7.458
2.930	12.213
4.012	15.833
4.961	17.548
5.953	20.624
6.947	21.930
7.964	22.419
9.004	22.363];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));
data.tL_f(:,2) = data.tL_f(:,2)/ 0.93; % convert FL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since hatch', 'total length', 'female'};  
temp.tL_f = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bird1975'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), f0rk length (cm)
0.000	1.987
0.924	4.020
1.939	7.458
2.998	11.350
3.990	14.789
4.939	15.823
6.001	17.401
6.973	18.072
7.967	18.561];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));
data.tL_m(:,2) = data.tL_m(:,2)/ 0.93; % convert FL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since hatch', 'total length', 'male'};  
temp.tL_m = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bird1975'; 

% length - fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
10.356	5743.741
12.007	3755.523
12.844	7157.585
13.292	8615.611
15.498	9764.359
15.991	14270.987
16.017	7555.228
17.048	4506.627
17.156	6053.019
17.502	19440.353
18.187	18114.875
19.196	21119.293
19.453	13210.604
20.648	26863.034
21.682	23107.511
22.058	28762.887
22.203	20235.641
22.774	19263.623];
data.LN(:,1) = data.LN(:,1)/ 0.93; % convert FL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Bird1975'; 

% weight - fecundity
data.WN = [ ... % wet weight (g), fecundity (#)
10.356	5743.741
12.007	3755.523
12.844	7157.585
13.292	8615.611
15.498	9764.359
15.991	14270.987
16.017	7555.228
17.048	4506.627
17.156	6053.019
17.502	19440.353
18.187	18114.875
19.196	21119.293
19.453	13210.604
20.648	26863.034
21.682	23107.511
22.058	28762.887
22.203	20235.641
22.774	19263.623];
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(12);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Bird1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; label.psd.k = 'maintenance ratio'; units.psd.k = '-';

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
F1 = 'Native to North America, variety of habitats, including anything from small streams to large lakes and reservoirs, and both high cold lakes, such as Lake Tahoe, and warmer desert streams';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Used to be called Gila bicolor';
metaData.bibkey.F2 = 'fishbase';
F3 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.12';
metaData.bibkey.F3 = 'fishbase';
F4 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F4 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '6YQQS'; % Cat of Life
metaData.links.id_ITIS = '913989'; % ITIS
metaData.links.id_EoL = '994803'; % Ency of Life
metaData.links.id_Wiki = 'Siphateles_bicolor'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2705658'; % Taxonomicon
metaData.links.id_WoRMS = '1017026'; % WoRMS
metaData.links.id_fishbase = 'Siphateles-bicolor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tui_chub}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Siphateles-bicolor.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fwspubs'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fwspubs.org/doi/suppl/10.3996/022013-JFWM-018/suppl_file/10.3996_022013-jfwm-018.s2.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Kuce1978'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Paul A. Kucera}, ' ...
'year = {1978}, ' ...
'title  = {REPRODUCTIVE BIOLOGY OF THE {T}UI CHUB, \emph{{G}ILA BICOLOR}, IN {P}YRAMID LAKE, {N}EVADA}, ' ...
'journal = {The Great Basin Naturalist}, ' ...
'pages = {203--207}, ' ...
'volume = {38}, ' ...
'number = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'ArchBona2009'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Thomas P. Archdeacon and SCOTT A. Bonar}, ' ...
'year = {2009}, ' ...
'title  = {Captive Breeding of Endangered {M}ohave Tui Chub}, ' ...
'journal = {North American Journal of Aquaculture}, ' ...
'pages = {360--362}, ' ...
'volume = {71}'];
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
