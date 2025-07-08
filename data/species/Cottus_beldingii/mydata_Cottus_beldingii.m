function [data, auxData, metaData, txtData, weights] = mydata_Cottus_beldingii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_beldingii'; 
metaData.species_en = 'Paiute sculpin'; 

metaData.ecoCode.climate = {'BSk','Csb','Csc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 24];


%% set data
% zero-variate data

data.am = 4.5 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'EberSumm1969';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.2;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Patt1971'; 
  comment.Lp = 'based on purberty in second yr and tL data';
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EberSumm1969';
  comment.Wwb = 'based on egg diameter of 2.1 mm : pi/6*0.21^3';
data.Wwi = 21.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';
  
% uni-variate data
% time-weight
data.tL = [ ... % age (years), total length (cm)
    1  3.15
    2  4.76
    3  5.76
    4  7.05];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EberSumm1969';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.283	39.114
4.497	44.481
4.568	40.945
4.578	62.249
4.674	58.126
4.674	53.392
4.723	36.834
4.817	52.237
4.852	63.486
4.853	56.978
4.853	54.611
4.877	46.332
4.925	48.708
4.960	50.490
4.971	66.468
4.985	41.619
4.985	37.477
4.996	48.722
5.007	62.925
5.007	58.192
5.031	55.829
5.032	51.687
5.138	61.768
5.161	69.464
5.186	53.493
5.187	49.943
5.208	74.799
5.306	46.416
5.362	84.889
5.375	75.424
5.377	56.489
5.387	70.693
5.388	66.551
5.388	63.592
5.388	59.450
5.398	89.629
5.410	80.165
5.470	82.543
5.588	88.484
5.590	63.632
5.637	74.884
5.637	71.334
5.648	80.803
5.649	68.969
5.719	85.551
5.767	81.418
5.768	78.460
5.768	74.318
5.768	71.359
5.770	52.425
5.791	85.565
5.792	66.630
5.838	95.633
5.874	92.090
5.887	70.791
5.898	80.261
5.959	67.255
5.969	93.292
5.981	86.786
5.992	96.256
5.995	58.978
6.063	107.512
6.065	79.110
6.077	82.663
6.088	91.541
6.088	86.215
6.089	75.565
6.090	64.322
6.099	103.377
6.113	72.611
6.114	70.244
6.194	109.905
6.198	56.059
6.220	83.874
6.220	79.141
6.254	93.940
6.291	85.072
6.292	76.196
6.314	96.319
6.314	89.810
6.314	88.035
6.373	101.656
6.373	96.331
6.391	170.299
6.412	59.652
6.421	91.607
6.480	98.127
6.495	67.952
6.503	108.191
6.673	73.905
6.673	69.171
6.801	105.291
6.977	137.870
6.980	98.226
6.989	142.606
6.990	121.896
6.992	102.370
7.176	181.696
7.298	150.951
7.576	92.426];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Patt1971';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYFV'; % Cat of Life
metaData.links.id_ITIS = '167238'; % ITIS
metaData.links.id_EoL = '596384'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_beldingii'; % Wikipedia
metaData.links.id_ADW = 'Cottus_beldingii'; % ADW
metaData.links.id_Taxo = '172053'; % Taxonomicon
metaData.links.id_WoRMS = '1019570'; % WoRMS
metaData.links.id_fishbase = 'Cottus-beldingii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_beldingii}}';
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
bibkey = 'EberSumm1969'; type = 'Article'; bib = [ ... 
'author = {Verlyn W. Ebert and Robert C. Summerfelt}, ' ... 
'year = {1969}, ' ...
'title = {Contributions to the life history of the piute sculpin, \emph{Cottus beldingii} {E}igenmann abd {E}igenmann, in {L}ake {T}ahoe}, ' ...
'journal = {Calif. Fish and Game}, ' ...
'volume = {55(2)}, ' ...
'pages = {100-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Patt1971'; type = 'Article'; bib = [ ... 
'author = {Benjamin G. Patten}, ' ... 
'year = {1971}, ' ...
'title = {Spawning and Fecundity of Seven Species of {N}orthwest {A}merican Cottus}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {85(2)}, ' ...
'pages = {493-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-beldingii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

