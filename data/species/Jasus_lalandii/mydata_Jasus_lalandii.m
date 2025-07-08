function [data, auxData, metaData, txtData, weights] = mydata_Jasus_lalandii

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palinuridae';
metaData.species    = 'Jasus_lalandii'; 
metaData.species_en = 'Cape rock lobster'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE', 'MISW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.7); % K, body temp
metaData.data_0     = {'am', 'Lp', 'Li', 'Wwb', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 27]; 

%% set data
% zero-variate data

data.am = 30*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(16.7);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 18;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'Wiki';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'BeyeGoos1987';
  comment.Wwb = 'based on egg diameter of 0.67 to 0.83 mm: pi/6*0.075^3';
data.Wwp = 92.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'BeyeGoos1987','sealifebase'};
data.Wwi = 2.85e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on 0.3470*Li^3.118, see F1';

data.Ri  = 2e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at CL = 9.9 cm';     bibkey.Ri  = 'BeyeGoos1987';   
  temp.Ri = C2K(16.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% length-growth data (capture recapture)
data.LL = [ ... % carapace length (cm), carapace length next yr (cm)
7.483	8.081
7.484	8.002
7.484	7.970
7.489	7.748
7.492	8.296
7.592	8.201
7.592	7.859
7.596	8.288
7.596	8.161
7.597	7.907
7.598	7.272
7.601	8.352
7.601	8.233
7.601	8.113
7.601	8.082
7.601	8.034
7.601	8.002
7.695	8.495
7.700	8.130
7.705	8.201
7.705	8.098
7.705	8.019
7.789	8.321
7.790	8.257
7.790	8.209
7.790	8.170
7.790	8.011
7.791	7.805
7.795	8.090
7.799	8.408
7.808	8.487
7.889	8.210
7.889	8.138
7.893	8.559
7.893	8.511
7.898	8.321
7.902	8.400
7.902	8.361
7.903	8.281
7.978	8.131
7.988	8.298
7.993	8.171
7.996	8.853
7.996	8.734
7.996	8.631
7.996	8.583
7.996	8.544
7.996	8.504
7.997	8.472
7.997	8.440
7.997	8.345
8.087	8.100
8.090	8.742
8.090	8.655
8.091	8.608
8.091	8.576
8.091	8.544
8.091	8.481
8.091	8.290
8.096	8.449
8.096	8.417
8.105	8.354
8.185	8.679
8.185	8.640
8.185	8.394
8.186	8.338
8.189	8.775
8.190	8.600
8.190	8.568
8.190	8.536
8.190	8.497
8.194	8.719
8.293	8.846
8.293	8.767
8.294	8.259
8.294	8.219
8.297	8.910
8.298	8.719
8.298	8.672
8.298	8.640
8.298	8.577
8.298	8.529
8.298	8.489
8.299	8.426
8.383	8.513
8.387	8.839
8.387	8.815
8.387	8.775
8.387	8.744
8.388	8.704
8.388	8.632
8.388	8.553
8.392	8.934
8.486	8.919
8.487	8.728
8.487	8.696
8.487	8.482
8.491	8.879
8.495	8.974
8.496	8.847
8.496	8.768
8.581	8.784
8.590	9.046
8.590	9.030
8.590	8.990
8.590	8.951
8.590	8.856
8.590	8.824
8.683	9.229
8.684	9.054
8.693	9.007
8.694	8.943
8.694	8.880
8.770	8.515
8.783	9.190
8.783	8.920
8.783	8.888
8.783	8.864
8.787	9.277
8.787	9.110
8.788	9.086
8.788	9.031
8.882	8.928
8.981	9.167
8.989	9.770
8.999	9.270
9.088	9.532
9.089	9.477
9.089	9.429
9.089	9.294
9.182	9.913
9.187	9.866
9.187	9.683
9.192	9.509
9.192	9.461
9.193	9.374
9.193	9.302
9.291	9.715
9.291	9.644
9.296	9.612
9.296	9.350
9.297	9.088
9.390	9.581
9.391	9.406
9.394	9.890
9.404	9.692
9.489	9.796
9.593	9.693
9.606	9.907
9.687	9.646
9.692	9.741
9.706	9.836
9.893	10.186];
units.LL   = {'cm', 'cm'};  label.LL = {'carapace length', 'carapace length next year'};  
temp.LL    = C2K(16.7);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'Cruy1997';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 10 * weights.LL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed, based on preferred temperature as reported in sealifebase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.3470*(carapace length in cm)^3.118 for Panulirus versicolor';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '852W2'; % Cat of Life
metaData.links.id_ITIS = '552953'; % ITIS
metaData.links.id_EoL = '46516788'; % Ency of Life
metaData.links.id_Wiki = 'Jasus_lalandii'; % Wikipedia
metaData.links.id_ADW = 'Jasus_lalandii'; % ADW
metaData.links.id_Taxo = '427795'; % Taxonomicon
metaData.links.id_WoRMS = '246322'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Jasus_lalandii}}';
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
bibkey = 'Cruy1997'; type = 'Article'; bib = [ ... 
'author = {Gerhard C. Cruywagen}, ' ... 
'year = {1997}, ' ...
'title = {The use of generalized linear modelling and inter-area variation of growth rates: example to determine inter-annual The {C}ape rock lobster as example}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {29}, ' ...
'pages = {119-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeyeGoos1987'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776187784522216}, ' ...
'author = {C. J. De B. Beyers and P. C. Goosen}, ' ... 
'year = {1987}, ' ...
'title = {Variations in fecundity and size at sexual maturity of female rock lobster  \emph{Jasus lalandii} in the Benguela ecosystem, South African}, ' ...
'journal = {Journal of Marine Science}, ' ...
'volume = {5}, ' ...
'pages = {513-521}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/jasus-lalandii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

