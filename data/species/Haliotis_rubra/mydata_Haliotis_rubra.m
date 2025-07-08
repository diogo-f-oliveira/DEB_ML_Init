function [data, auxData, metaData, txtData, weights] = mydata_Haliotis_rubra
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Vetigastropoda'; 
metaData.family     = 'Haliotidae';
metaData.species    = 'Haliotis_rubra'; 
metaData.species_en = 'Blacklip abalone'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 09]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.7; units.Lp  = 'cm';  label.Lp  = 'shell width at puberty for female'; bibkey.Lp  = 'HeliHadd2011';
  comment.Lp = '3 to 9 cm';
data.Li  = 20; units.Li  = 'cm';  label.Li  = 'ultimate shell width';              bibkey.Li  = 'sealifebase';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 0.02 mm egg diameter: pi/6*0.02^3';   
data.Wwi = 1.3e3/3;  units.Wwi = 'g'; label.Wwi = 'shell-free wet weight'; bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on data Haliotis tuberculata, which gives a (total?) weight of 1.3 kg at shell length; the assumption is that shell-free weight is 1/3 of this';   

data.Ri  = 7.5e6/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'sealifebase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% length-change in length data
data.LdL = [ ... % initial length (cm), yearly length increment (cm/yr)
5.674	1.270
5.972	1.870
6.151	1.964
6.299	2.345
6.657	1.870
6.835	2.252
7.133	2.540
7.222	1.964
7.431	1.964
7.669	0.997
7.788	2.166
8.145	2.260
8.145	1.777
8.294	2.860
8.324	2.081
8.413	1.777
8.503	1.870
8.711	1.590
8.949	2.260
8.979	2.166
9.009	1.878
9.217	1.870
9.336	1.964
9.485	2.735
9.604	1.590
9.694	2.462
9.783	1.481
10.051	2.065
10.319	1.184
10.497	2.057
10.587	1.574
10.616	1.769
10.646	1.184
10.855	2.049
10.884	1.278
10.944	0.990
11.004	1.395
11.093	2.244
11.093	1.184
11.123	1.668
11.152	1.870
11.331	1.473
11.361	1.769
11.480	2.338
11.480	1.870
11.480	1.083
11.480	1.387
11.599	2.065
11.599	1.675
11.658	1.870
11.837	1.496
11.956	1.473
12.046	1.668
12.046	1.496
12.165	1.481
12.254	1.745
12.313	0.997
12.462	1.286
12.522	1.465
12.522	1.075
12.522	0.499
12.641	1.286
12.641	0.881
12.671	0.694
13.177	1.278
13.207	1.683
13.356	0.787
13.385	1.387
13.415	0.000
13.534	0.803
13.623	0.709
13.713	0.904
14.189	0.592
14.249	0.694
14.308	0.974
14.338	0.888
14.368	0.499
14.398	0.779
14.427	0.312
14.487	0.896
14.487	0.787
14.517	0.405
14.546	0.506
14.695	0.694
14.695	0.584
14.785	0.218
14.904	0.094
14.904	-0.094
14.993	0.499
15.112	1.068
15.172	0.312
15.291	0.312
15.291	-0.281
15.350	0.312
15.529	0.312
15.529	0.109
15.529	-0.070
15.648	-0.179
15.708	0.203
15.827	0.312
15.856	-0.179
15.886	0.000
16.035	0.109
16.184	0.000
16.482	0.000
16.720	-0.195
16.928	-0.062
17.107	0.000];
units.LdL   = {'cm', 'cm/yr'};  label.LdL = {'initial length', 'yearly length increment'};  
temp.LdL    = C2K(15);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'HeliHadd2011';
comment.LdL = 'data from capture-tag-recapture';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3JDZK'; % Cat of Life
metaData.links.id_ITIS = '1048507'; % ITIS
metaData.links.id_EoL = '4792496'; % Ency of Life
metaData.links.id_Wiki = 'Haliotis_rubra'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3959985'; % Taxonomicon
metaData.links.id_WoRMS = '445354'; % WoRMS
metaData.links.id_molluscabase = '445354'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Haliotis_rubra}}';
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
bibkey = 'HeliHadd2011'; type = 'Article'; bib = [ ... 
'author = {Fay Helidoniotis and Malcolm Haddon and Geoff Tuck and David Tarbath}, ' ... 
'year = {2011}, ' ...
'title = {The relative suitability of the von Bertalanffy, Gompertz and inverse logistic models for describing growth in blacklip abalone populations (\emph{Haliotis rubra}) in {T}asmania, {A}ustralia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {112}, ' ...
'pages = {13-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Haliotis-rubra.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

