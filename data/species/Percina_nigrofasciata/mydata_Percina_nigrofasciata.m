  function [data, auxData, metaData, txtData, weights] = mydata_Percina_nigrofasciata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Percina_nigrofasciata'; 
metaData.species_en = 'Blackbanded darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 28]; 

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Math1973';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.0;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Math1973'; 
data.Li = 11;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Math1973';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwi = 9.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
   comment.Wwi = 'relationship 0.00513*11^3.14 (see F1)';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 3.41
    2 4.66
    3 4.94
    4 5.60];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Karr1963';
comment.tL = 'Data for Percina_nigrofasciata, which also has Li = 11 cm';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.296	36.914
4.648	54.923
4.783	64.835
4.866	56.479
5.004	56.575
5.082	64.110
5.185	67.454
5.275	73.594
5.477	92.901
5.603	95.794
5.666	120.612
5.805	116.970
5.870	133.844
5.958	146.060
6.064	183.062
6.172	165.375
6.383	195.907
6.467	183.344
6.874	254.682];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Math1973';

% weight - fecundity
data.WwN = [ ... % weight weight (g), fecundity (#)
0.616	36.233
0.872	63.829
0.884	54.154
1.035	51.460
1.164	53.609
1.249	64.126
1.378	65.836
1.462	93.936
1.475	67.997
1.592	90.810
1.773	117.116
1.781	145.244
1.805	114.027
1.825	132.041
2.349	180.195
2.361	163.487
2.564	193.741
2.931	182.174
3.216	251.957];
units.WwN = {'g', '#'}; label.WwN = {'wet weight','fecundity'};  
temp.WwN = C2K(18);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature';
bibkey.WwN = 'Math1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;
weights.Lp =  5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

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
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.89 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7744M'; % Cat of Life
metaData.links.id_ITIS = '168490'; % ITIS
metaData.links.id_EoL = '203978'; % Ency of Life
metaData.links.id_Wiki = 'Percina_nigrofasciata'; % Wikipedia
metaData.links.id_ADW = 'Percina_nigrofasciata'; % ADW
metaData.links.id_Taxo = '183484'; % Taxonomicon
metaData.links.id_WoRMS = '954585'; % WoRMS
metaData.links.id_fishbase = 'Percina-nigrofasciata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Percina_nigrofasciata}}';  
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
bibkey = 'Karr1963'; type = 'article'; bib = [ ...  
'author = {James R. Karr}, ' ...
'year = {1963}, ' ...
'title = {Age, Growth, and Food Habits of Johnny, Slenderhead and Blacksided Darters of Boone County, {I}owa}, ' ... 
'journal = {Proceedings of the Iowa Academy of Science}, ' ...
'volume = {70}, '...
'pages = {228-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percina_nigrofasciata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Math1973'; type = 'article'; bib = [ ...  
'author = {Dilip Mathur}, ' ...
'year = {1973}, ' ...
'title = {Some Aspects of Life History of the Blackbanded Darter, \emph{Percina nigrofasciata} ({A}gassiz), in {H}alawakee {C}reek, {A}labama}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {89(2)}, '...
'pages = {381-393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

