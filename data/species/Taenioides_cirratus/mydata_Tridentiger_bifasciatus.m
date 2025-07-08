  function [data, auxData, metaData, txtData, weights] = mydata_Tridentiger_bifasciatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Tridentiger_bifasciatus'; 
metaData.species_en = 'Shimofuri goby'; 

metaData.ecoCode.climate = {'MB','BWh','BSk','Cfa'};
metaData.ecoCode.ecozone = {'MPNW','MPE','TH',};
metaData.ecoCode.habitat = {'0iMr','0iFe','0iMm','0iFm'};
metaData.ecoCode.embryo  = {'Mc','Fs'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 12]; 

%% set data
% zero-variate data
data.am = 1.5 * 365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'QinXian2020';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on remark that life span is short';
 
data.Lp = 3.7;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';           bibkey.Lp = 'QinXian2020'; 
data.Li = 9.96;    units.Li = 'cm'; label.Li = 'ultimate standard length';           bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 12 cm and F2';
 
data.Wwb = 2.6e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'QinXian2020';
  comment.Wwb = 'based on egg diameter of 0.79 mm: pi/6*0.079^3';
data.Wwi = 30.14; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','Slat2005'};
   comment.Wwi = 'based on 0.00000405 * (10*Li)^3.305 (see F1) for Tridentiger barbatus';
 
% univariate data

% time-length
data.tL = [ ... % time (month), total length (cm)
 1 3.606
 2 4.136
 3 4.623
 4 4.797
 5 5.263
 6 5.532
 7 5.889
 8 6.267
 9 6.624
10 7.024
11 7.402
12 7.737];
data.tL(:,1) = 30.5 * (5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'QinXian2020';
comment.tL = 'data from length frequencies';

% length - fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
3.757	2909.763
3.793	3250.342
3.855	3807.716
3.895	4302.923
3.935	3839.864
4.090	3780.445
4.095	2265.836
4.108	5017.192
4.122	2884.484
4.126	4399.230
4.157	4925.212
4.170	4399.917
4.179	3596.348
4.228	4400.810
4.290	4432.684
4.299	5885.676
4.325	5700.617
4.375	3908.488
4.392	4156.058
4.397	5701.716
4.397	5268.951
4.405	6258.266
4.406	4990.882
4.477	4528.304
4.508	5517.963
4.539	5240.237
4.553	3694.854
4.561	4591.433
4.597	4437.424
4.614	7652.525
4.614	6879.730
4.632	4932.562
4.685	6386.241
4.734	8025.321
4.747	6789.056
4.766	4007.269
4.774	6171.232
4.791	8675.362
4.797	5398.780
4.810	7006.400
4.827	6759.380
4.850	5492.340
4.859	5987.066
4.881	7749.382
4.894	6265.822
4.903	7440.608
4.917	3298.633
4.942	8801.345
5.093	9731.034
5.151	8959.132
5.173	9361.329
5.174	7846.651
5.196	6548.699
5.200	8867.153
5.209	8218.142
5.249	9640.703
5.271	11062.989
5.280	9826.655
5.281	7322.799
5.307	8219.653
5.338	7941.928
5.383	7818.968
5.391	9148.312
5.404	13197.964
5.578	10294.934
5.622	9182.796
5.649	9646.885
5.663	7297.795
5.676	7854.413
5.689	11069.446
5.720	10328.044
5.760	10606.868
5.760	9895.897
5.768	11843.478
5.786	11349.164
5.786	10854.575
5.809	11720.449
5.809	9216.593
5.853	9804.604
5.880	8661.280
5.955	11135.391
5.986	11290.431
6.235	10274.189
6.278	17106.382
6.345	15314.529
6.449	9411.956
6.480	11978.116
6.489	11360.017
6.492	18067.945
6.497	12225.685
6.670	14423.101
6.786	11550.090
7.234	15142.796];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'QinXian2020';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 8 * weights.psd.v;
weights.psd.p_M = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g =  0.00000405 * (TL in mm)^3.305';
metaData.bibkey.F1 = 'Slat2005'; 
F2 = 'length-length: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '58NVZ'; % Cat of Life
metaData.links.id_ITIS = '553361'; % ITIS
metaData.links.id_EoL = '46576655'; % Ency of Life
metaData.links.id_Wiki = 'Tridentiger_bifasciatus'; % Wikipedia
metaData.links.id_ADW = 'Tridentiger_bifasciatus'; % ADW
metaData.links.id_Taxo = '189443'; % Taxonomicon
metaData.links.id_WoRMS = '283045'; % WoRMS
metaData.links.id_fishbase = 'Tridentiger-bifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tridentiger_bifasciatus}}';  
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
bibkey = 'QinXian2020'; type = 'article'; bib = [ ...  
'author = {Jiao Qin and Miao Xiang and Meixiang Jia and Fei Cheng and Lei Zhang and Bjorn Victor Schmidt and Jian Liu and and Songguang Xie}, ' ...
'year = {2020}, ' ...
'title = {Combined opportunistic and equilibrium life-history traits facilitate successful invasions of the {S}himofuri goby (\emph{Tridentiger bifasciatus})}, ' ... 
'journal = {Aquatic Invasions}, ' ...
'volume = {15}, ' ...
'number = {in press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Slat2005'; type = 'phdthesis'; bib = [ ...  
'author = {Steven Barnard Slater}, ' ...
'year = {2005}, ' ...
'title = {Life history and diet of the {S}hokihaze goby \emph{Tridentiger barbatus} in the {S}an {F}rancisco estuary}, ' ... 
'school = {California State University, Sacramento}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tridentiger-bifasciatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
