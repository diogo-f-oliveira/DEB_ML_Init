function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_virgatus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_virgatus';
metaData.species_en = 'Striped plateau lizard';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 06];

%% set data
% zero-variate data;
data.ab = 48;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 10*30.5;  units.tp = 'd';      label.tp = 'age at birth';        bibkey.tp = 'Vine1975';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.1;  units.Lb  = 'cm';  label.Lb  = 'SVL ate birth';   bibkey.Lb  = 'Vine1975';
data.Lp  = 4.0; units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'Vine1975';
data.Li  = 6.8; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Vine1975';

data.Wwb = 0.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Vine1975';
  comment.Wwb = '0.3-0.5 g';
data.Wwi = 11.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Vine1975';
  comment.Wwi = 'based on 7.83 g for mean female weight and assumed mean SVL of 6 cm: (6.8/6)^3*7.83';

% uni-variate data
% time-length
data.tL = [... % time (d), SVL (cm)
0.000	4.560
14.977	4.791
30.062	5.051
44.556	5.328
59.150	5.414
73.968	5.376
88.817	5.647];
data.tL(:,1) = data.tL(:,1); % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vine1975'; 

% length-fecundity
data.LN = [ ... % SVL (cm), yearly fecundity (#)
4.796	4.906
4.992	4.934
5.011	4.739
5.098	4.906
5.101	5.912
5.196	6.918
5.201	5.856
5.201	4.906
5.201	3.900
5.213	5.940
5.213	5.772
5.294	4.906
5.299	6.862
5.302	5.968
5.313	5.828
5.392	6.918
5.397	10.914
5.400	5.940
5.400	4.906
5.417	6.834
5.495	3.872
5.495	7.896
5.498	4.794
5.501	5.856
5.501	8.902
5.504	8.846
5.509	7.701
5.515	5.800
5.599	6.890
5.602	4.906
5.602	5.856
5.607	6.806
5.697	5.912
5.700	9.936
5.700	8.846
5.702	11.920
5.702	7.924
5.705	6.918
5.708	9.796
5.708	8.790
5.708	6.834
5.711	5.772
5.714	8.064
5.716	7.868
5.722	6.974
5.795	10.942
5.795	9.936
5.798	6.890
5.800	8.930
5.800	7.924
5.814	8.790
5.817	6.806
5.896	10.830
5.898	6.918
5.898	10.048
5.901	8.874
5.901	12.926
5.904	7.896
5.907	10.747
5.907	10.970
5.910	9.880
5.912	9.880
5.921	8.902
5.996	11.920
5.996	10.942
5.996	8.930
5.996	6.918
5.996	5.856
5.999	7.896
6.002	12.842
6.002	9.880
6.010	9.768
6.010	8.818
6.024	9.964
6.094	9.936
6.097	6.946
6.097	10.914
6.097	11.920
6.097	12.926
6.103	8.930
6.103	9.796
6.105	10.719
6.105	10.942
6.108	8.874
6.114	9.042
6.114	9.964
6.192	12.898
6.192	10.970
6.192	9.908
6.195	8.902
6.198	11.892
6.198	7.980
6.201	13.960
6.201	6.890
6.203	10.774
6.203	8.735
6.206	9.992
6.206	9.824
6.209	12.786
6.212	11.054
6.217	8.930
6.293	12.898
6.296	9.908
6.296	11.892
6.299	8.874
6.299	14.882
6.301	6.890
6.301	13.932
6.304	10.914
6.307	11.780
6.310	12.786
6.310	12.982
6.313	8.790
6.315	9.768
6.321	10.747
6.321	10.970
6.321	13.848
6.396	12.898
6.396	11.948
6.399	9.852
6.402	10.914
6.413	12.814
6.419	11.836
6.422	12.060
6.500	8.902
6.500	10.942
6.500	11.864
6.500	13.848
6.508	8.735
6.598	10.942
6.598	9.880
6.601	15.860
6.601	13.876
6.699	10.914
6.802	13.904];    
units.LN  = {'cm', '#m'};  label.LN = {'SVL', 'yearly fecundity'};  
temp.LN = C2K(20); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Vine1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'tp is ignorned due to inconsistency with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4V5D6'; % Cat of Life
metaData.links.id_ITIS = '173881'; % ITIS
metaData.links.id_EoL = '793962'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_virgatus'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_virgatus'; % ADW
metaData.links.id_Taxo = '574004'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=virgatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_virgatus}}';   
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
bibkey = 'Vine1975'; type = 'article'; bib = [ ...  
'author = {Marian B. Vinegar}, ' ...
'title = {Demography of the Striped Plateau Lizard, \emph{Sceloporus virgatus}}, ' ...
'journal = {Ecology}, ' ...
'pages = {172-182}, ' ...
'volume = {56(1)}, ' ...
'year = {1975}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

