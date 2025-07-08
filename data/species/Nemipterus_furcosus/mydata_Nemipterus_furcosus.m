  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_furcosus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_furcosus'; 
metaData.species_en = 'Fork-tailed threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 14];

%% set data

% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.8;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'RahmSama2021'; 
data.Li = 24;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.8 mm: pi/6*0.08^3';
data.Wwp = 40; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'RahmSama2021';
data.Wwi = 230;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'RahmSama2021';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0 11.5
    1 18.3
    2 19.5
    3 23.2
    4 24.4];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'record 265';

% weight-fecundity
data.WN = [ ... % weight(log10 g), fecundity (log10 #)
1.739	4.762
1.753	4.732
1.764	4.778
1.776	4.758
1.788	4.751
1.801	4.766
1.804	4.810
1.810	4.751
1.811	4.786
1.813	4.826
1.819	4.742
1.828	4.780
1.831	4.751
1.836	4.867
1.840	4.801
1.850	4.832
1.854	4.799
1.854	4.812
1.855	4.847
1.862	4.854
1.863	4.793
1.869	4.801
1.870	4.849
1.876	4.819
1.878	4.871
1.882	4.766
1.884	4.841
1.889	4.893
1.898	4.799
1.905	4.955
1.916	4.821
1.917	4.801
1.926	4.893
1.931	4.863
1.932	4.922
1.937	4.950
1.942	4.900
1.946	4.825
1.951	4.865
1.954	4.944
1.957	4.970
1.963	4.913
1.966	4.996
1.972	4.891
1.979	4.910
1.985	4.963
1.987	4.922
1.997	4.976
2.002	4.967
2.003	4.950
2.004	5.024
2.005	4.991
2.018	4.897
2.025	5.024
2.027	4.904
2.032	4.904
2.040	4.952
2.041	4.992
2.053	5.018
2.053	5.059
2.059	4.994
2.072	4.989
2.073	5.042
2.079	5.024
2.086	5.070
2.105	5.007
2.114	5.086
2.126	5.074
2.128	5.055
2.128	5.121
2.144	5.083
2.163	5.118
2.185	5.109
2.203	5.201
2.205	5.153
2.207	5.118
2.218	5.177
2.219	5.122
2.225	5.149
2.229	5.173
2.237	5.204
2.265	5.250
2.282	5.232
2.289	5.252
2.292	5.193
2.297	5.243
2.298	5.227
2.304	5.287
2.320	5.247
2.321	5.296
2.325	5.269
2.333	5.300
2.337	5.271
2.339	5.368
2.340	5.227
2.361	5.379];
data.WN = 10.^data.WN; % undo log10 trasformation
units.WN = {'g','#'}; label.WN = {'weight','fecundity'};  
temp.WN = C2K(28);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'RahmSama2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467Z9'; % Cat of Life
metaData.links.id_ITIS = '168993'; % ITIS
metaData.links.id_EoL = '46581025'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_furcosus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_furcosus'; % ADW
metaData.links.id_Taxo = '180970'; % Taxonomicon
metaData.links.id_WoRMS = '278122'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-furcosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_furcosus}}';  
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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RahmSama2021'; type = 'article'; bib = [ ...  
'author = {Mustafizur M. Rahman and Amira F. Samat}, ' ...
'year = {2021}, ' ...
'title = {Reproductive cycle, sexual maturity and fecundity of \emph{Nemipterus furcosus} ({V}alenciennes, 1830)}, ' ... 
'journal = {Aquaculture and Fisheries}, ' ...
'volume = {6}, '...
'pages = {424–431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-furcosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
