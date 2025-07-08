function [data, auxData, metaData, txtData, weights] = mydata_Melarhaphe_neritoides
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Littorinidae';
metaData.species    = 'Melarhaphe_neritoides'; 
metaData.species_en = 'Small periwinkle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiFl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'L_j'; 'Lp'; 'Li'; 'Wwd'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 03]; 

%% set data
% zero-variate data

data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.05; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';         bibkey.Lj  = 'MyerMcGr1993';
data.Lp  = 0.38; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty for female'; bibkey.Lp  = 'guess';
data.Li  = 0.73; units.Li  = 'cm';  label.Li  = 'ultimate shell height';              bibkey.Li  = 'HughRobe1980';

data.Wwb = 2.68e-7;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'EoL';
  comment.Wwb = 'based on egg diameter of 80 mum: pi/6*0.008^3';
data.Wdi = 7.1e-3;  units.Wdi = 'g'; label.Wdi = 'ulitmate dry tissue weight'; bibkey.Wdi = 'guess';
  comment.Wwb = 'based on length-weight relationship for  Littorina littorea: 0.4*(0.73/2.8)^3';


% uni-variate data
% t-L data
data.tL = [ ... % time since 1 nov 1977 (d), shell height (cm)
30.158	0.058
61.709	0.066
93.239	0.073
121.563	0.073
152.411	0.074
183.430	0.092
213.142	0.106
244.762	0.121
275.070	0.131
306.069	0.147
337.076	0.164
366.715	0.170
398.282	0.180
428.777	0.209];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % set origin at first data point
units.tL   = {'d', 'cm'};  label.tL = {'time since 1 nov 1977', 'shell height'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MyerMcGr1993';
comment.tL = 'Data for population at Carnsore Point, Ireland';

% L-N data
data.LN = [ ... % log shell height (mm), log fecundity (#)
1.195	2.783
1.315	5.755
1.340	2.844
1.343	5.897
1.349	6.371
1.411	3.971
1.432	3.552
1.444	5.079
1.462	2.659
1.479	3.291
1.481	3.081
1.484	3.572
1.488	4.379
1.496	6.064
1.503	6.942
1.504	2.398
1.525	7.118
1.535	3.908
1.539	7.646
1.540	5.593
1.552	2.611
1.554	4.050
1.573	5.472
1.577	4.437
1.620	6.615
1.653	4.266
1.653	4.003
1.656	6.126
1.672	6.145
1.678	3.180
1.679	4.952
1.695	4.690
1.697	6.023
1.704	6.374
1.704	3.638
1.733	5.324
1.742	7.657
1.754	6.711
1.765	4.027
1.787	5.783
1.798	3.450
1.825	8.013
1.829	5.031
1.834	6.944
1.845	5.716
1.862	6.664
1.863	3.577
1.868	4.560
1.869	7.051
1.877	1.806
1.889	4.473
1.895	6.456
1.896	4.263
1.908	4.755
1.930	8.633
1.965	8.337
2.000	6.006
2.080	5.747];
data.LN = exp(data.LN); % remove log transform
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'shell height', 'fecundity'};  
temp.LN    = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN  = 'HughRobe1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.LN(data.LN(:,2) < 1e3) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperature (in C) for tL data is summposed to vary in time (in d) as T(t)=13+8*sin(2*pi*(t-150)/365';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Pelagic egg capsules release planktonic veligers';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZCF4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '619411'; % Ency of Life
metaData.links.id_Wiki = 'Melarhaphe_neritoides'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '695276'; % Taxonomicon
metaData.links.id_WoRMS = '140266'; % WoRMS
metaData.links.id_molluscabase = '140266'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Melarhaphe_neritoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/619411}}';
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
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.marlin.ac.uk/species/detail/1489}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HughRobe1980'; type = 'Article'; bib = [ ... 
'author = {Roger N. Hughes AND Derek J. Roberts}, ' ... 
'year = {1980}, ' ...
'title = {GROWTH AND REPRODUCTIVE RATES OF  \emph{Littorina neritoides} ({L}.) IN NORTH {W}ALES}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {60}, ' ...
'pages = {591-599}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MyerMcGr1993'; type = 'Article'; bib = [ ... 
'author = {A.A. Myers and David McGrath}, ' ... 
'year = {1993}, ' ...
'title = {SETTLEMENT AND GROWTH OF THE INTERTIDAL GASTROPOD, \emph{Melarhaphe neritoides}, ON THE SOUTH COAST OF {I}RELAND}, ' ...
'journal = {Mar. Biol. Ass. U.K. }, ' ...
'volume = {73}, ' ...
'pages = {313-319}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

