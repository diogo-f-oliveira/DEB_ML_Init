function [data, auxData, metaData, txtData, weights] = mydata_Noturus_exilis

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_exilis'; 
metaData.species_en = 'Slender madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 26]; 

%% set data
% zero-variate data;

data.ab = 8.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'fishbase';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Vive1987';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.74/0.88;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Vive1987';
  comment.Lp = 'Based on SL 4.74 cm, see F2';
data.Li  = 15;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 4.68e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Vive1987'; 
  comment.Wwb = 'based on egg diameter of 2.1 to 4.47 mm: pi/6*0.447^3';
data.Wwp = 1.1; units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Vive1987','fishbase'};
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 25.4; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';
 
% uni-variate data
% time-length
data.tL = [ ... % year class (yr), standard length (cm)
-0.528	3.737
-0.448	3.593
-0.286	4.492
-0.211	3.937
-0.123	4.629
-0.044	4.836
0.208	5.196
0.618	5.897
0.708	5.723
0.793	5.477
0.881	6.036
0.965	5.848
1.380	6.843
1.474	6.875
1.628	7.011
1.707	6.852
1.786	6.987
1.872	6.359
1.960	6.787
2.111	8.375
2.192	7.526
2.286	7.764
2.356	7.033
2.450	7.373
2.515	7.125
2.625	6.850
2.696	8.480];
data.tL(:,1) = (0.9 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.88; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vive1987';

% weight - fecundity
data.WwN = [ ... weight (g), fecundity (#)
2.044	46.816
2.130	26.940
2.428	50.221
2.504	47.781
2.674	53.305
3.888	71.173
3.910	95.037
4.090	82.207
4.118	71.502
4.140	97.202
4.449	104.576
4.554	98.162
4.966	95.145
4.998	100.043
5.065	65.786
5.943	138.074
6.951	131.753
8.365	151.782];
units.WwN   = {'g', '#'};  label.WwN = {'weight weight', 'fecundity'};  
temp.WwN    = C2K(20);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature';
bibkey.WwN = 'Vive1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL and WwN data varied between 3 and 28 C';
metaData.bibkey.D1 = 'Vive1987'; 
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.88*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZMJ'; % Cat of Life
metaData.links.id_ITIS = '164010'; % ITIS
metaData.links.id_EoL = '208015'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_exilis'; % Wikipedia
metaData.links.id_ADW = 'Noturus_exilis'; % ADW
metaData.links.id_Taxo = '181565'; % Taxonomicon
metaData.links.id_WoRMS = '1020284'; % WoRMS
metaData.links.id_fishbase = 'Noturus-exilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_exilis}}';
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
bibkey = 'Vive1987'; type = 'Article'; bib = [ ... 
'author = {Stephen P. Vives},'...
'title = {Aspects of the Life History of the Slender Madtom \emph{Noturus exilis} in {N}ortheastern {O}klahoma ({P}isces: {I}ctaluridae)},'...
'journal = {The American Midland Naturalist},'...
'volume = {117(1)},'...
'year = {1987},'...
'pages = {167-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-exilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

