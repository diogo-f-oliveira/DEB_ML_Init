function [data, auxData, metaData, txtData, weights] = mydata_Saccostrea_cuccullata

%% set metaData 
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreoida'; 
metaData.family     = 'Ostreidae';
metaData.species    = 'Saccostrea_cuccullata'; 
metaData.species_en = 'Hooded oyster';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.3; 

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 22]; 

%% set data
% zero-variate data
data.am = 26*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'ArkhBouc2017';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Minimum value';

data.Lp  = 0.58;      units.Lp  = 'cm';   label.Lp  = 'total length at release';        bibkey.Lp  = 'guess';
  comment.Lp = 'based on Ostra edulis: (1/2597)^(1/3)*Li)';
data.Li  = 8;           units.Li  = 'cm';   label.Li  = 'maximum length';                 bibkey.Li = 'ArkhBouc2017';

data.Wwb = 0.0000046;   units.Wwb = 'g';    label.Wwb = 'tissue wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Ostrea chilensis'; 
data.Wdi = 3.5;    units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';                 bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ostrea chilensis'; 

data.Ri  = 29e3; units.Ri  = '#/d';  label.Ri  = 'max reproduction rate';                 bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.98';

% uni-variate data
% time-length
data.tL = [...
1.899	4.529
1.899	4.719
1.977	2.465
2.093	3.766
2.132	3.258
2.132	3.861
2.984	7.318
2.984	6.619
2.984	6.461
2.984	5.508
2.984	5.381
2.984	5.223
2.984	5.096
2.984	4.969
2.984	4.873
2.984	4.397
2.984	4.302
2.984	3.477
3.023	5.921
3.023	3.667
3.062	4.810
3.062	4.651
3.062	3.159
3.101	6.936
3.953	5.028
3.953	5.155
3.992	5.599
3.992	6.520
3.992	6.774
3.992	6.933
3.992	7.123
3.992	7.314
3.992	7.631
4.031	5.917
4.031	6.075
4.031	6.361
4.961	6.325
4.961	4.579
5.000	8.167
5.000	7.373
5.000	7.246
5.000	7.024
5.000	6.865
5.000	6.611
5.000	5.373
5.039	7.627
5.078	6.134
5.078	5.944
5.930	8.544
5.969	5.781
6.008	9.210
6.008	4.797
6.008	4.956
6.008	6.797
6.008	7.210
6.008	7.496
6.047	9.114
6.047	6.480
6.899	7.238
6.899	7.428
7.016	5.682
7.016	5.841
7.016	6.221
7.016	6.348
7.016	6.793
8.023	7.614
8.062	6.598
8.062	5.360
8.101	11.804
8.140	5.995
8.992	8.753
8.992	9.007
9.031	7.927
9.961	9.130
10.039	7.828
10.039	6.367
11.008	9.157
11.008	6.935
11.085	7.538];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArkhBouc2017';
comment.tL = 'Data from shelly Beach, Ascension Island';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6WYJ2'; % Cat of Life
metaData.links.id_ITIS = '79893'; % ITIS
metaData.links.id_EoL = '47369504'; % Ency of Life
metaData.links.id_Wiki = 'Saccostrea'; % Wikipedia
metaData.links.id_ADW = 'Saccostrea_cuccullata'; % ADW
metaData.links.id_Taxo = '568838'; % Taxonomicon
metaData.links.id_WoRMS = '181316'; % WoRMS
metaData.links.id_molluscabase = '181316'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saccostrea_cucullata}}';
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
bibkey = 'ArkhBouc2017'; type = 'Article'; bib = [ ... 
'author = {Alexander Arkhipkin and Elena Boucher and Micha\"{e}l Gras and Paul Brickle}, ' ... 
'year   = {2017}, ' ...
'title  = {Variability in age and growth of common rock oyster \emph{Saccostrea cucullata} ({B}ivalvia) in {A}scension {I}sland (central-east {A}tlantic)}, ' ...
'journal= {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {97(4)}, ' ...
'doi    = {10.1017/S0025315414001982}, '...
'pages  = {735-742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Saccostrea-cucullata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

