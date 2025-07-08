function [data, auxData, metaData, txtData, weights] = mydata_Brachydeuterus_auritus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Brachydeuterus_auritus'; 
metaData.species_en = 'Bigeye grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2024 12 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26]; 

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 46.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.04, see F1';
data.Wwi = 398; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.04, see F1';

data.Ri  = 74045/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'Adeb2012';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
181.359	6.060
243.450	8.781
272.748	8.792
304.501	10.054
334.150	10.262
365+1.265	10.866
365+30.202	11.469
365+59.490	12.269
365+150.895	13.882
365+182.658	14.354
365+213.709	15.287
365+304.418	16.175
365+334.408	17.239
730+0.826	17.185
730+31.887	17.393
730+59.761	18.325
730+91.183	17.941
730+120.112	19.202
730+182.244	18.830
730+213.658	19.039
730+243.653	19.773
730+274.359	20.114
1095+120.790	21.243
1095+212.911	22.066];
data.tL(:,1) = data.tL(:,1) + 0;  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KonaJoan2015';

% length-weight
data.LW = [ ... % total length (cM), weight (g)
8.024	9.395
8.086	6.263
9.023	8.351
9.024	13.570
10.023	13.048
10.023	17.223
10.055	20.877
10.960	20.355
10.961	28.184
11.053	15.658
11.085	23.486
11.958	16.180
11.991	27.662
11.992	37.578
12.021	18.789
12.084	23.486
12.085	32.881
12.990	24.008
12.991	32.881
12.991	38.622
12.992	41.754
13.024	47.495
13.053	29.749
13.084	27.140
13.929	49.061
13.930	53.236
13.990	34.969
14.022	44.363
14.053	39.144
14.929	52.714
14.930	61.587
14.960	56.889
14.991	48.539
15.020	35.491
15.024	67.328
15.084	44.885
15.990	51.148
16.023	63.674
16.023	68.372
16.024	78.288
16.084	58.977
16.180	73.591
16.961	74.635
16.991	72.025
16.992	77.766
16.993	81.942
16.994	90.292
17.021	62.630
17.022	67.850
17.024	85.595
17.961	82.985
17.962	97.077
17.993	92.380
18.057	101.775
18.994	106.994
18.994	111.691
18.995	116.910
18.996	123.173
19.904	144.572
19.935	148.747
19.963	115.344
19.995	125.783
20.026	120.042
20.027	131.002
20.965	147.182
21.029	155.532
21.907	185.804
22.029	167.015
22.908	202.505
23.001	197.286
23.064	206.159
23.973	232.777
24.001	207.203
24.067	237.474];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'KonaJoan2015';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01288*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WQ3L'; % Cat of Life
metaData.links.id_ITIS = '169108'; % ITIS
metaData.links.id_EoL = '46578430'; % Ency of Life
metaData.links.id_Wiki = 'Brachydeuterus_auritus'; % Wikipedia
metaData.links.id_ADW = 'Brachydeuterus_auritus'; % ADW
metaData.links.id_Taxo = '164512'; % Taxonomicon
metaData.links.id_WoRMS = '126943'; % WoRMS
metaData.links.id_fishbase = 'Brachydeuterus-auritus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachydeuterus_auritus}}';
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
bibkey = 'KonaJoan2015'; type = 'Article'; bib = [ ... 
'doi = {10.15739/IJAPR.043}, ' ...
'author = {Kouadio Justin Konan and Tap\''{e} Gnahor\''{e} Toussaint Joanny and Souma\"{i}la Sylla and Luaia Lianthuam and K Lohith Kumar}, ' ... 
'year = {2015}, ' ...
'title = {Stock assessment of the bigeye grunt \emph{Brachydeuterus auritus} ({V}alenciennes, 1832) in the coastal water of {I}vory {C}oast}, ' ...
'journal = {International Journal of Agricultural Policy and Research}, ' ...
'volume = {3(5)}, ' ...
'pages = {222-230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Adeb2012'; type = 'Article'; bib = [ ... 
'howpublished = {\url{http://www.sciencepub.net/nature}}, ' ...
'author = {Fatimat Adenike Adebiyi}, ' ... 
'year = {2012}, ' ...
'title = {Aspects of reproductive biology of big eye grunt \emph{Brachydeuterus auritus} ({V}alenciennes, 1832)}, ' ...
'journal = {Nature and Science}, ' ...
'volume = {10(2)}, ' ...
'pages = {19-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Brachydeuterus-auritus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
