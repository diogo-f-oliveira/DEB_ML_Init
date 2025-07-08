function [data, auxData, metaData, txtData, weights] = mydata_Lagenorhynchus_obscurus
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Lagenorhynchus_obscurus'; 
metaData.species_en = 'Dusky dolphin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2017 11 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 22]; 


%% set data
% zero-variate data
data.tg = 12.9*30.5;    units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'Wiki';    
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 12 * 30.5;units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';    
  temp.tx = C2K(36.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 7 * 365; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 46 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(36.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for L. obliquidens';

data.Lb = 70;        units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'EoL';
data.Li = 175;       units.Li = 'cm'; label.Li = 'ultimate total length for female'; bibkey.Li = 'Wiki';

data.Wwb = 5000;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'ADW';
data.Wwi = 80000;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'Wiki';

data.Ri = 1/(12.9 + 12 + 3.7)/30.5;  units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight data
data.tW = [ ... % time since birth (yr), weight (kg)
1.940	52.184
2.083	55.409
2.168	58.491
2.299	53.257
2.355	55.909
2.586	53.112
2.801	53.684
2.900	56.910
2.957	57.411
3.044	57.267
3.044	55.690
3.130	55.761
3.303	54.399
3.389	53.681
3.461	54.613
3.605	53.107
3.662	53.106
3.805	55.113
3.932	59.126
3.989	60.273
4.047	58.982
4.162	58.193
4.235	56.902
4.321	56.615
4.464	56.973
4.535	59.123
4.649	60.843
5.108	60.840
5.210	58.044
5.597	59.547
5.710	65.210
5.781	64.994
5.811	61.553
5.883	62.270
5.954	62.413
6.054	64.061
6.168	66.856
6.212	65.063
6.354	67.930
6.370	64.417
6.484	65.707
6.571	63.269
6.670	66.710
6.772	64.128
6.828	67.784
6.943	66.852
7.000	68.858
7.302	66.993
7.402	67.924
7.574	66.991
7.676	63.048
7.747	65.772
7.804	65.126
7.947	68.351
7.948	64.767
8.064	62.688
8.177	67.848
8.264	64.980
8.436	65.911
8.508	64.836
8.579	64.835
8.666	63.114
8.837	67.343
8.937	67.772
9.023	67.198
9.123	69.277
9.181	68.416
9.266	69.706
9.339	66.552
9.467	69.705
9.512	64.042
9.612	65.690
9.699	64.901
9.741	66.549
9.756	65.976
9.928	65.903
10.042	68.627
10.158	65.113
10.258	65.758
10.415	67.621
10.530	65.828
10.689	63.964
10.746	64.752
10.847	63.748
10.947	63.747
11.047	64.893
11.349	64.820
11.535	66.826
11.894	65.749
11.995	63.885
12.066	63.956
12.225	62.808
12.540	62.663
12.569	63.666
12.613	61.086
12.684	63.666
12.740	66.676
12.797	66.891
12.798	65.816
12.869	65.887
12.883	67.679
12.955	67.750
12.983	69.972
13.198	70.616
13.370	68.895
13.558	66.815
13.600	68.822
14.144	73.407
14.331	71.399
14.432	68.674
14.633	68.745];
data.tW(:,1) = 365 * (data.tW(:,1) + 3); % convert yr to d
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(36.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KastElst2000';
comment.tW = 'Data for female';

%% set weights for all real data
weights = setweights(data, []);
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3RWSJ'; % Cat of Life
metaData.links.id_ITIS = '180445'; % ITIS
metaData.links.id_EoL = '46559266'; % Ency of Life
metaData.links.id_Wiki = 'Lagenorhynchus_obscurus'; % Wikipedia
metaData.links.id_ADW = 'Lagenorhynchus_obscurus'; % ADW
metaData.links.id_Taxo = '68729'; % Taxonomicon
metaData.links.id_WoRMS = '231434'; % WoRMS
metaData.links.id_MSW3 = '14300065'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagenorhynchus_obscurus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KastElst2000'; type = 'Article'; bib = [ ... 
'author = {R. A. Kastelein and C. A. van der Elst and H. K. Tennant and P. R. Wiepkema}, ' ... 
'year = {2000}, ' ...
'title = {Food Consumption and Growth of a Female Dusky Dolphin (\emph{Lagenorhynchus obscurus})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {19}, ' ...
'pages = {131-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lagenorhynchus_obscurus/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/317317/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lagenorhynchus_obliquidens}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

