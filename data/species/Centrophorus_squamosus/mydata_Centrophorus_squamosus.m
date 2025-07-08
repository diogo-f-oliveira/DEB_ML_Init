function [data, auxData, metaData, txtData, weights] = mydata_Centrophorus_squamosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Centrophoridae';
metaData.species    = 'Centrophorus_squamosus'; 
metaData.species_en = 'Leafscale gulper shark'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];


%% set data
% zero-variate data

data.am = 70*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 40;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'SeveAfon2009';  
data.Lp  = 128;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ClarConn2002'; 
  comment.Lp = 'based on TL 332-341 cm and F3';
data.Lpm  = 150;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ClarConn2002'; 
  comment.Lpm = 'based on TL 270-288 cm anf F3';
data.Li  = 164;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'ClarConn2002';

data.Wwp = 12.6e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'ClarConn2002';
  comment.Wwp = 'based on  0.00245*Lp^3.20, see F2, see F2';
data.Wwi = 30e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'ClarConn2002';
  comment.Wwi = 'based on 0.00245*Li^3.20, see F2';

data.Ri  = 5.4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'SeveAfon2009';   
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-10 pups per litter';
  
 % uni-variate data
 
% t-L data post birth
data.tL_f = [ ... % time since birth (yr), total length (cm)
20.936	99.348
23.129	102.857
25.085	98.496
26.010	102.873
27.053	109.873
29.126	106.825
30.050	109.890
30.969	105.086
32.007	106.840
33.054	119.086
34.090	116.906
35.122	110.355
36.041	105.988
36.973	119.108
38.234	109.497
39.155	108.191
40.087	121.311
41.238	118.257
42.159	116.513
43.198	118.705
44.007	122.644
45.280	129.645
46.089	131.835
47.125	130.092
48.163	130.535
50.349	125.301
52.198	131.432
58.192	131.027
61.191	134.104
65.336	126.695
70.295	130.219];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'ClarConn2002';
comment.tL_f = 'Data for females';
%
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
21.009	111.789
22.997	104.579
26.974	107.706
27.925	99.714
30.000	113.486
31.037	109.691
32.161	106.279
33.026	105.151
34.928	114.343
36.052	110.168
37.003	109.805
37.867	112.110
38.905	110.604
40.029	109.863
40.893	111.405
42.882	107.628
44.870	111.099
45.821	115.314
46.859	113.045
48.069	103.150
49.798	111.575
52.911	107.438];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'ClarConn2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D2 = 'Deep water species';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.bibkey.D2 = 'fishbase'; 
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00245*(TL in cm)^3.20';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5XHNL'; % Cat of Life
metaData.links.id_ITIS = '160635'; % ITIS
metaData.links.id_EoL = '46560157'; % Ency of Life
metaData.links.id_Wiki = 'Centrophorus_squamosus'; % Wikipedia
metaData.links.id_ADW = 'Centrophorus_squamosus'; % ADW
metaData.links.id_Taxo = '41807'; % Taxonomicon
metaData.links.id_WoRMS = '105901'; % WoRMS
metaData.links.id_fishbase = 'Centrophorus-squamosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centrophorus_squamosus}}';
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
bibkey = 'ClarConn2002'; type = 'Article'; bib = [ ... 
'doi = {10.1006/jfbi.2001.1861}, ' ...
'author = {M. W. Clarke and P. L. Connolly and J. J. Bracken}, ' ... 
'year = {2002}, ' ...
'title = {Age estimation of the exploited deepwater shark \emph{Centrophorus squamosus} from the continental slopes of the {R}ockall {T}rough and {P}orcupine {B}ank}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {60}, ' ...
'pages = {501-514}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeveAfon2009'; type = 'Article'; bib = [ ... 
'author = {Ricardo B. Severino and I. Afonso-Dias and J. Delgado and M. Afonso-Dias}, ' ... 
'year = {2009}, ' ...
'title = {Aspects of the biology of the leaf-scale gulper shark \emph{Centrophorus squamosus} ({B}onnaterre, 1788) off {M}adeira archipelago}, ' ...
'journal = {Arquip\''{e}lago. Life and Marine Sciences}, ' ...
'volume = {26}, ' ...
'pages = {57-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Centrophorus-squamosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Centrophorus_squamosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

