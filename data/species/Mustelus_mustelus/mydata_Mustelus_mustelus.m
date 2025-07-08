function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_mustelus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_mustelus'; 
metaData.species_en = 'Common smooth-hound'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.3); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 1.2*365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 24*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(15.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 36;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'GoosSmal1997';
data.Lp = 132;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'GoosSmal1997';
data.Lpm = 98; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'GoosSmal1997';
data.Li  = 204;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'GoosSmal1997';
data.Lim  = 153;  units.Lim  = 'cm';    label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'GoosSmal1997';

data.Wwi  = 29.1e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'GoosSmal1997','fishbase'};
  comment.Wwi = 'based on 0.00191*Li^3.11, see F3';
data.Wwim  = 11.9e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight';  bibkey.Wwim  = {'GoosSmal1997','fishbase'};
  comment.Wwim = 'based on 0.00191*Li^3.11, see F3';

data.Ri  = 15/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 pups per litter, 1 litter per 2 yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.088	36.044
0.979	48.759
2.035	49.602
2.083	58.713
2.084	56.337
2.994	85.291
3.056	65.888
3.057	63.908
3.086	59.157
3.998	83.754
3.999	80.586
4.005	68.309
4.056	72.272
4.945	90.136
4.948	84.196
5.057	76.676
5.942	103.253
5.998	95.731
5.999	94.939
6.003	87.018
6.019	107.613
6.971	104.094
6.974	97.361
6.982	81.916
6.994	110.035
7.920	107.307
7.922	102.159
7.985	82.360
7.995	114.043
8.951	104.188
8.980	97.853
9.001	110.131
9.948	115.720
10.951	117.352
10.973	125.274
11.944	136.805
11.948	129.281
12.899	128.534
12.920	139.228
12.957	117.051
13.941	155.118
14.954	136.948
16.897	157.239
16.929	146.547
17.925	159.664
17.933	144.615
18.900	163.274
18.909	145.453
19.934	154.611
20.914	149.509
20.937	155.054
23.942	164.306];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GoosSmal1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.086	46.388
1.984	45.243
2.028	63.859
2.059	53.959
2.109	58.714
2.974	72.221
2.977	65.488
2.981	58.359
2.982	55.191
3.025	76.579
3.995	90.091
4.000	79.398
4.003	74.250
4.004	71.873
4.023	86.924
4.025	81.775
4.948	83.799
4.966	100.830
4.996	93.307
4.998	90.138
5.003	79.050
5.926	81.866
6.048	102.466
6.048	102.070
6.943	107.261
6.945	102.112
6.947	98.152
6.965	115.579
6.977	91.817
6.979	88.252
6.981	84.292
7.039	73.998
7.913	121.168
7.920	106.119
7.970	111.666
7.975	101.765
7.976	100.181
7.978	95.825
7.980	92.260
8.946	112.900
8.948	110.524
8.951	104.188
9.916	127.996
9.960	91.166
9.972	120.474
10.916	133.984
10.931	102.698
10.972	127.254
11.004	115.770
11.901	117.001
11.919	134.032
11.930	112.250
12.029	124.532
12.928	123.387
12.929	119.822
13.876	126.600
13.878	122.640
13.935	115.514
13.946	145.613
16.938	128.330];
data.tL_m(:,1) = data.tL_m(:,1)*365; % % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GoosSmal1997';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 800 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00191 * (TL in cm)^3.11';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44R2T'; % Cat of Life
metaData.links.id_ITIS = '160242'; % ITIS
metaData.links.id_EoL = '46559984'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_mustelus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_mustelus'; % ADW
metaData.links.id_Taxo = '41952'; % Taxonomicon
metaData.links.id_WoRMS = '105822'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-mustelus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_mustelus}}';  
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
bibkey = 'GoosSmal1997'; type = 'article'; bib = [ ... 
'doi = {10.2989/025776197784161072}, ' ...
'author = {A. J. J. Goosen and M. J. Smale}, ' ...
'year = {1997}, ' ...
'title  = {A preliminary study of age and growth of the smoothhound shark \emph{Mustelus mustelus} ({T}riakidae)}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {18(1)}, ' ...
'pages = {85-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-mustelus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

