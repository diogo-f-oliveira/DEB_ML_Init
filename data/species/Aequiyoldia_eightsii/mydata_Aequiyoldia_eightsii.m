function [data, auxData, metaData, txtData, weights] = mydata_Aequiyoldia_eightsii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Nuculanida'; 
metaData.family     = 'Sareptidae';
metaData.species    = 'Aequiyoldia_eightsii'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 22]; 

%% set data
% zero-variate data

data.am = 120*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'PeckBull1993';   
  temp.am = C2K(2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.075; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'guess';
data.Lp  = 2; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'LauGran2018';
  comment.Lp = 'based on same relative length, compared to Mya arenaria: (2.34/15)*Li';
data.Li  = 4.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'PeckBull1993';

data.Wwb = 2.9e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LauGran2018';
  comment.Wwb = 'based on egg diameter of 94 mum: pi/9*0.0094^3'; 
data.Wwd = 0.474; units.Wwd = 'g';   label.Wwd = 'ultimate wet weight';     bibkey.Wwd = 'guess';
  comment.Wwd = 'based on size-corrected value for Macoma baltica: 0.131*(4.3/2.8)^3';

data.Ri  = 8e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate for assumed SL 3 cm'; bibkey.Ri  = 'LauGran2018';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '"more than 3000", 4e3 is assumed and also 2 cycles per yr';

% uni-variate data

% initial length- length after 2 mnth
data.LL = [ ... % shell length (cm), change in shell length after 2 mnth (cm)
0.758688	0.010000
0.819720	0.015625
0.847216	-0.000125
0.870001	0.025375
0.871693	0.010562
0.873428	0.040375
0.917970	0.010375
0.936237	0.030438
0.970521	0.045250
0.971592	0.035875
1.043074	0.040000
1.104769	0.039813
1.144750	0.004750
1.270368	0.029875
1.277114	0.060812
1.286943	0.019750
1.308593	0.010187
1.335983	0.040375
1.367997	0.030062
1.401147	0.009813
1.438794	0.040187
1.439394	0.034937
1.450808	0.025000
1.507899	0.020125
1.546724	0.040187
1.582122	0.045250
1.589553	0.025187
1.590666	0.015437
1.628956	0.040187
1.664397	0.044875
1.691786	0.030062
1.706048	0.040187
1.728319	0.025187
1.754552	0.020500
1.794597	0.029875
1.796246	0.015437
1.859120	0.049937
1.871711	0.029687
1.872739	0.020687
1.912763	0.030250
1.918502	0.025000
1.935077	0.014875
1.939553	0.020687
1.974437	0.030250
1.978999	0.035313
2.011506	0.020687
2.012148	0.015062
2.048639	0.010562
2.077206	0.030438
2.078341	0.020500
2.089262	0.014875
2.142970	-0.005375
2.145818	0.014687
2.150337	0.020125
2.154727	0.026687
2.226722	0.026312
2.247944	0.020500
2.272550	0.030062
2.279402	0.015062
2.319897	0.020500
2.366217	0.019937
2.382770	0.010000
2.392514	0.014687
2.412365	0.020875
2.432410	0.025375
2.439262	0.010375
2.471855	0.040000
2.479843	0.015062
2.515241	0.020125
2.540917	0.020312
2.545436	0.025750
2.576894	0.020312
2.603748	0.010187
2.650003	0.010187
2.711677	0.010187
2.741979	0.014875
2.761359	0.025187
2.773351	0.010187
2.782452	0.020500
2.831042	0.000062
2.853827	0.025562
2.855583	0.010187
2.870359	0.015812
2.900682	0.020312
2.927536	0.010187
2.933832	0.000062
2.973749	0.010562
2.982936	0.020125
3.040605	0.010187
3.075425	0.020312
3.098318	-0.000125
3.107440	0.010000
3.117120	0.015250
3.125193	-0.010438
3.128576	0.004938
3.136521	0.025375
3.170849	-0.005187
3.189651	0.010187
3.195390	0.004938
3.239804	0.021062
3.287301	0.010187
3.291284	0.020312
3.319295	0.000062
3.363259	0.020125
3.387778	0.030438
3.428402	-0.010250
3.491703	0.020500
3.549416	0.010187
3.554534	0.010375];
data.LL(:,2) = sum(data.LL,2);
units.LL   = {'cm', 'cm'};  label.LL = {'shell length', 'shell length after 61 d'};  
temp.LL    = C2K(2);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'PeckBull1993';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 5 * weights.LL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '64Z6Q'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46465771'; % Ency of Life
metaData.links.id_Wiki = 'Sareptidae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '6429413'; % Taxonomicon
metaData.links.id_WoRMS = '868255'; % WoRMS
metaData.links.id_molluscabase = '868255'; % molluscabase


%% References
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46473266}}';
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
bibkey = 'PeckBull1993'; type = 'Article'; bib = [ ... 
'author = {L. S. Peck and L. W. Bullough}, ' ... 
'year = {1993}, ' ...
'title = {Growth and population structure in the infaunal bivalve \emph{Yoldia eightsi} in relation to iceberg activity at {S}igny {I}sland, {A}ntarctica}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {117}, ' ...
'pages = {235-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LauGran2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-018-2309-2}, ' ...
'author = {Sally C. Y. Lau and Laura J. Grange and Lloyd S. Peck and Adam J. Reed}, ' ... 
'year = {2018}, ' ...
'title = {The reproductive ecology of the {A}ntarctic bivalve \emph{Aequiyoldia eightsii} ({P}rotobranchia: {S}areptidae) follows neither {A}ntarctic nor taxonomic patterns}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {41}, ' ...
'pages = {1693-1706}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
