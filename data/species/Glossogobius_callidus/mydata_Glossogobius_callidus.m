function [data, auxData, metaData, txtData, weights] = mydata_Glossogobius_callidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Glossogobius_callidus'; 
metaData.species_en = 'River goby'; 

metaData.ecoCode.climate = {'Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 23];

%% set data
% zero-variate data

data.ab = 3.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'MofuWood2020';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'HajjOuan2013'; 
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.3 mm: pi/6*0.03^3';
data.Wwp = 0.54;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','HajjOuan2013'};
  comment.Wwp = 'based on 0.01023*Lp^3.03, see F1';
data.Wwi = 19; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.03, see F1';

% uni-variate data
% time-length
data.tL = [... %  time since birth (yr), total length (cm)
0.044	0.491
0.054	0.369
0.125	0.509
0.250	0.527
0.967	5.345
0.973	3.068
0.975	5.222
0.983	3.768
0.983	3.926
0.983	4.084
1.932	8.850
1.938	6.048
1.938	6.538
1.946	5.224
1.947	5.662
1.947	6.258
1.948	7.641
1.949	8.219
1.956	5.785
1.956	5.995
1.957	7.081
1.957	7.274
1.963	4.577
1.964	5.049
1.965	6.153
1.965	6.888
1.966	6.976
1.966	7.764
1.966	7.869
1.981	4.436
1.981	4.874
2.898	4.088
2.899	4.789
2.902	8.624
2.908	5.087
2.908	5.314
2.910	7.293
2.916	4.491
2.917	5.402
2.917	5.630
2.918	6.208
2.918	6.295
2.918	6.365
2.918	6.470
2.919	7.083
2.919	7.416
2.919	7.696
2.925	4.334
2.927	6.068
2.927	6.628
2.927	6.786
2.928	7.819
2.928	7.959
2.930	9.745
2.935	5.209
2.936	7.206
2.937	8.187
2.938	9.097
2.943	4.702
2.943	4.964
2.944	5.875
2.947	8.817
2.948	9.623
2.948	10.288
2.962	5.560
2.966	10.779
3.881	7.629
3.882	8.487
3.883	9.590
3.889	6.718
3.889	7.243
3.896	4.634
3.897	5.229
3.897	5.877
3.898	6.385
3.898	6.525
3.898	6.788
3.898	7.033
3.899	8.172
3.900	8.977
3.906	5.369
3.906	6.035
3.907	6.911
3.910	9.853
3.915	5.562
3.915	5.720
3.915	6.210
3.922	4.336
3.924	5.650
3.925	7.103
3.925	7.348
3.925	7.541
3.926	8.329
3.926	8.679
3.931	3.758
4.849	5.267
4.868	6.405
4.869	6.755
4.869	7.473
4.869	7.596
4.871	9.890
4.878	7.053
4.879	8.297
4.885	4.671
4.885	5.670
4.886	6.125
4.886	6.633
4.888	8.051
4.888	8.402
4.895	6.248
4.895	6.843
4.896	7.351
4.897	8.227
4.898	10.223
4.902	4.199
4.907	9.400
4.907	10.083
4.916	9.680
4.916	10.468
5.840	7.511
5.841	8.737
5.847	5.304
5.847	5.760
5.848	6.040
5.849	7.213
5.850	8.894
5.851	9.262
5.857	7.073
5.865	5.567
5.866	6.583
5.875	7.301
5.883	5.882
6.863	6.480]; 
data.tL(:,1) = 365 * (.3 + data.tL(:,1)); 
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MofuWood2020'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
7.309	503.687
7.597	719.164
8.110	618.826
8.229	775.159
8.454	441.982
8.650	487.257
8.735	692.177
8.763	782.474
9.029	195.854
9.128	779.255
9.170	980.674
9.338	1102.318
9.542	835.099
9.879	1154.777
10.111	1741.744
10.638	1742.109
10.764	1884.558
10.799	2117.221
11.045	1971.559];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
bibkey.LN = 'MofuWood2020'; comment.LM = 'data from fig 4, but labels adapted according to text';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KJR9'; % Cat of Life
metaData.links.id_ITIS = '637371'; % ITIS
metaData.links.id_EoL = '222796'; % Ency of Life
metaData.links.id_Wiki = 'Glossogobius_callidus'; % Wikipedia
metaData.links.id_ADW = 'Glossogobius_callidus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '1021364'; % WoRMS
metaData.links.id_fishbase = 'Glossogobius-callidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glossogobius_callidus}}';
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
bibkey = 'MofuWood2020'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.14478}, ' ...
'author = {Mofu, L. and Woodford, D. J. and Wasserman, R. J. and Weyl, O. L. F.}, ' ... 
'year = {2020}, ' ...
'title = {LIFE‐HISTORY OF THE RIVER GOBY \emph{Glossogobius callidus} ({T}ELEOSTEI: {G}OBIIDAE)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {97}, ' ...
'pages = {1600-1606}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Glossogobius-callidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

