function [data, auxData, metaData, txtData, weights] = mydata_Nezumia_aequalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Nezumia_aequalis'; 
metaData.species_en = 'Common Atlantic grenadier'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];

%% set data
% zero-variate data

data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'fishbase given 4.5 cm, but is probably PAL, not TL';
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'FernRami2013';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 17.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00182*Lp^3.12, see F1';  
data.Wwi = 130;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00182*Li^3.12, see F1';

data.Ri  = 10630/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'FernRami2013';   
  temp.Ri = C2K(9.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), pre-anal length (cm)
0.796	2.592
0.819	2.607
0.854	3.090
0.863	2.636
0.871	2.198
0.874	2.591
0.875	3.120
0.876	3.120
0.882	2.182
0.906	2.575
0.915	2.182
0.934	1.577
0.948	2.197
0.951	2.575
0.953	3.059
0.956	3.512
0.957	1.592
0.976	3.149
0.981	2.196
0.982	2.590
0.984	2.590
0.989	3.512
0.993	2.196
1.006	2.589
1.072	2.573
1.747	3.095
1.780	3.094
1.781	3.094
1.815	3.502
1.824	3.109
1.837	3.502
1.838	3.502
1.857	3.063
1.859	3.532
1.890	3.093
1.895	4.061
1.909	2.564
1.910	2.564
1.938	4.075
1.939	4.075
1.947	3.501
1.948	3.516
1.956	3.107
2.000	3.107
2.831	4.065
2.848	3.082
2.853	4.034
2.854	4.034
2.861	3.520
2.884	3.520
2.900	4.473
2.901	4.473
2.903	5.017
2.904	3.127
2.911	4.548
2.925	5.047
2.926	3.126
2.928	3.519
2.929	3.519
2.931	4.094
2.945	2.597
2.953	4.124
2.954	4.124
2.966	4.502
2.971	3.489
3.008	4.033
3.696	5.008
3.762	5.007
3.814	4.477
3.817	5.082
3.843	5.641
3.858	4.461
3.861	5.051
3.862	5.096
3.863	5.096
3.869	4.476
3.878	4.022
3.879	6.034
3.880	6.094
3.883	5.051
3.884	5.066
3.900	4.052
3.911	6.064
3.920	5.640
3.931	5.655
3.936	4.521
3.939	5.111
3.944	6.063
3.950	5.080
3.952	5.473
3.961	5.080
3.983	5.095
4.845	5.584
4.861	4.495
4.864	5.039
4.866	5.523
4.897	5.084
4.898	5.099
4.902	6.022
4.913	6.052
4.924	4.055
4.925	6.067
4.933	5.537
4.941	5.008
4.944	5.537
4.946	3.995
4.949	4.494
4.957	4.040
4.960	6.550
4.961	6.550
4.966	5.567
4.971	4.539
4.977	5.552
4.990	6.021
4.991	6.021
4.992	6.051
4.996	5.083
5.007	5.038
5.018	5.098
5.896	6.539
5.899	5.057
5.902	5.541
5.938	6.131
5.949	6.085
5.951	6.524
5.957	5.541
5.965	7.053
5.971	6.115
5.977	5.117
6.004	6.084
6.894	5.590
6.907	6.044
6.926	5.514
6.935	7.072
6.940	6.013
6.957	7.071
6.962	6.028
6.963	6.103
6.974	6.103
6.975	6.421
6.976	6.451
6.981	5.513
6.982	5.544
7.061	7.962
7.932	6.107
8.004	7.104
8.992	6.579];
data.tL(:,1) = 365*(0.5+data.tL(:,1)); % convert yr to d
data.tL(:,2) = 4.2*data.tL(:,2); % convert pre-anal length to total length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(9.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MassuMora1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00182*(TL in mm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 4.2*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,  'F2',F2);

%% Links
metaData.links.id_CoL = '47C2Y'; % Cat of Life
metaData.links.id_ITIS = '165394'; % ITIS
metaData.links.id_EoL = '46564626'; % Ency of Life
metaData.links.id_Wiki = 'Nezumia_aequalis'; % Wikipedia
metaData.links.id_ADW = 'Nezumia_aequalis'; % ADW
metaData.links.id_Taxo = '181273'; % Taxonomicon
metaData.links.id_WoRMS = '126473'; % WoRMS
metaData.links.id_fishbase = 'Nezumia-aequalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nezumia_aequalis}}';
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
bibkey = 'MassuMora1995'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0967-0637(95)00003-o}, ' ...
'author = {Massut\''{i}, E. and Morales-Nin, B. and Stefanescu, C.}, ' ... 
'year = {1995}, ' ...
'title = {Distribution and biology of five grenadier fish ({P}isces: {M}acrouridae) from the upper and middle slope of the northwestern {M}editerranean}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'volume = {42(3)}, ' ...
'pages = {307–330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FernRami2013'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2013.03.003}, ' ...
'author = {MU. Fernandez-Arcayaa and E. Ramirez-Llodra and G. Rotllant and L. Recasens and H. Murua and I. Quaggio-Grassiotto and J.B. Company}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of two macrourid fish, \emph{Nezumia aequalis} and \emph{Coelorinchus mediterraneus}, inhabiting the {NW} {M}editerranean continental margin (400–2000 m)}, ' ...
'journal = {Deep Sea Research Part II: Topical Studies in Oceanography}, ' ...
'volume = {92}, ' ...
'pages = {63-72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Nezumia-sclerorhynchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

