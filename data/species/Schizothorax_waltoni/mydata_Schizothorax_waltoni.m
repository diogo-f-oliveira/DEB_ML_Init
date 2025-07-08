  function [data, auxData, metaData, txtData, weights] = mydata_Schizothorax_waltoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizothorax_waltoni'; 
metaData.species_en = 'Snowtrout'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 17];

%% set data
% zero-variate data
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'QiuChen2009';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 47.9;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'ZhouXiw2015'; 
data.Lpm = 36.9;    units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'ZhouXiw2015'; 
data.Li = 63.4;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ZhouXiw2015';
  comment.Wwb = 'Computed from egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 2350;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
    
% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
    5 23.25  167.1
    6 25.87  218.3
    7 28.61  287.5
    8 31.40  364.4
    9 32.65  388.0
   10 33.15  479.2
   11 34.90  545.0
   12 36.90  676.0
   14 37.30  674.0
   15 43.00  880.0
   16 43.80 1091.0
   17 45.50 1223.5
   18 46.87 1346.3
   19 50.00 1491.0
   20 51.10 1591.0
   21 51.50 1688.0];
data.tLW(:,1) = 365 * (.8+data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(9);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1, {'std length','weight'}};
bibkey.tLW = 'QiuChen2009';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
44.308	12227.174
44.546	13118.041
45.278	9020.048
45.582	11158.130
45.714	13028.956
45.927	10445.438
45.991	12227.174
46.103	8930.958
46.474	11514.476
46.547	9821.826
47.297	11959.913
47.958	8396.436
47.985	11247.215
48.371	21314.033
48.603	11603.567
49.346	16146.994
49.485	15701.560
49.586	16414.255
50.033	16236.082
50.174	14899.777
50.451	13830.736
50.721	15879.733
50.864	13474.388
50.877	21848.552
51.030	15701.560
51.267	16948.776
51.944	20957.684
52.153	19888.643
52.277	24966.592
52.302	15077.953
52.431	18463.251
52.950	17037.862
52.980	18463.251
53.174	10000.001
53.762	21581.291
54.634	29866.371
54.679	38953.230
54.694	33073.499
54.890	23897.551
55.131	10000.001
55.286	29866.371
55.302	23719.378
55.557	18195.993
55.922	36191.538
55.925	21848.552
56.118	26926.504
56.170	33340.757
56.176	31113.587
56.198	22561.247
56.938	15345.211
56.999	31380.848
57.396	37260.580
58.027	32360.804
58.183	25055.680
58.226	35033.408
58.545	31202.673
58.874	50089.087
59.362	34142.540];
units.LN = {'cm', '#'}; label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ZhouXiw2015';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 0 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4VDC6'; % Cat of Life
metaData.links.id_ITIS = '690087'; % ITIS
metaData.links.id_EoL = '216912'; % Ency of Life
metaData.links.id_Wiki = 'Schizothorax_waltoni'; % Wikipedia
metaData.links.id_ADW = 'Schizothorax_waltoni'; % ADW
metaData.links.id_Taxo = '186981'; % Taxonomicon
metaData.links.id_WoRMS = '1018160'; % WoRMS
metaData.links.id_fishbase = 'Schizothorax-waltoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Schizothorax_waltoni}}';  
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
bibkey = 'QiuChen2009'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10228-009-0096-z}, ' ...
'author = {Hao Qiu and Yi-Feng Chen}, ' ...
'year = {2009}, ' ...
'title = {Age and growth of \emph{Schizothorax waltoni} in the {Y}arlung {T}sangpo {R}iver in {T}ibet, {C}hina}, ' ... 
'journal = {Ichthyol. Res.}, ' ...
'volume = {56(3)}, '...
'pages = {260–265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhouXiw2015'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-014-0293-0}, ' ...
'author = {Zhou, Xian-Jun and Xie, Cong-Xin and Huo, Bin and Duan, You-Jian and Yang, Xin and Ma, Bao-Shan}, ' ...
'year = {2015}, ' ...
'title = {Reproductive biology of \emph{Schizothorax waltoni}({C}iprinidae: {S}chizothoracinae) in the {Y}arlung {Z}angbo {R}iver in {T}ibet, {C}hina}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {98(2)}, '...
'pages = {597–609}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Schizothorax-waltoni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shodhganga'; type = 'Misc'; bib = ...
'howpublished = {\url{http://shodhganga.inflibnet.ac.in/bitstream/10603/68389/14/14_chapter 7.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

