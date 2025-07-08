  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_erythrogaster
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_erythrogaster'; 
metaData.species_en = 'Southern redbelly dace'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 17]; 

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Sett1974';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.64;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Sett1974';
  comment.Lp = 'based SL 3.9 cm and F2';
data.Li = 9.1;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 5.89e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Sett1974';
  comment.Wwb = 'based on egg diameter of 1.04 mm: pi/6*0.104^3';
data.Wwp = 0.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','Sett1974'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 6.37;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

% univariate data
% time-length
data.tL = [ ... % yr class (yr), std length (cm)
138.684	0.122
182.308	1.688
214.315	2.268
243.399	2.539
275.371	3.001
305.801	3.046
337.729	3.365
367.413	3.280
365+30.649	3.088
365+92.203	3.132
365+122.052	3.593
365+152.461	3.567
365+184.544	4.397
365+211.434	4.431
365+244.059	4.714
365+292.888	4.782
365+304.205	4.782
365+337.519	5.005
365+367.964	5.098
730+31.994	5.191
730+91.448	5.306
730+125.458	5.494
730+150.843	5.231
730+218.161	5.619
730+245.744	5.605
730+306.691	5.982];
data.tL(:,1) = data.tL(:,1) - 138; % set origin at birth
data.tL(:,2) = data.tL(:,2)/ 0.84; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sett1974'; 

% length fecundity
data.LN = [ ... % std length (cm), fecundity (#)
3.912	247.148
4.002	219.584
4.100	238.985
4.195	205.689
4.346	267.439
4.450	291.418
4.531	313.124
4.755	244.213
4.848	288.823
5.003	301.307
5.317	515.306
5.410	459.097
5.506	541.512
5.606	298.555
5.722	427.927
5.829	619.170
5.903	616.822
6.023	623.605
6.095	684.270
6.515	570.528];
data.LN(:,1) = data.LN(:,1)/ 0.84; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Sett1974'; 

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

%% Facts
F1 = 'length-weight Ww in g = 0.00708 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHY6'; % Cat of Life
metaData.links.id_ITIS = '913994'; % ITIS
metaData.links.id_EoL = '208300'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_erythrogaster'; % Wikipedia
metaData.links.id_ADW = 'Chrosomus_erythrogaster'; % ADW
metaData.links.id_Taxo = '43625'; % Taxonomicon
metaData.links.id_WoRMS = '1020289'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-erythrogaster'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chrosomus_erythrogaster}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrosomus-erythrogaster.html}}';  
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
bibkey = 'Sett1974'; type = 'phdthesis'; bib = [ ...  
'author = {William Settles}, ' ...
'year = {1974}, ' ...
'title = {Some Aspects of the Life History of the Southern Redbelly Dace, \emph{Chrosomus Erythrogaster} {R}afinesque, in {I}vy {C}reek, {W}arren {C}ounty, {K}entucky}, ' ... 
'school = {Western Kentucky University}, ' ...
'howpublished = {\url{https://digitalcommons.wku.edu/theses/2818}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

