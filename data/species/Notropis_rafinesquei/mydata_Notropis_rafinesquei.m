function [data, auxData, metaData, txtData, weights] = mydata_Notropis_rafinesquei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_rafinesquei'; 
metaData.species_en = 'Yazoo shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 25]; 

%% set data
% zero-variate data

data.am = 2*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'HaagComm2007';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.21;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'HaagComm2007'; 
  comment.Lp = 'based on SL 2.6 cm and F2';
data.Li = 5.16;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  comment.Li = 'based on 4.18 cm and F2';
  
data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HaagComm2007';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
  
data.Ri  = 305/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HaagComm2007';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 5*30.5 1.568
 7*30.5 2.200
 8*30.5 2.615
14*30.5 2.621
16*30.5 2.776
18*30.5 3.126];
data.tL(:,2) = data.tL(:,2)/ 0.81; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HaagComm2007'; 

% length - weight
data.LWw = [ ... % log10 standard length (mm), log10 wet weight (g)
1.420	-1.370
1.452	-1.231
1.453	-1.243
1.460	-1.237
1.462	-1.100
1.470	-1.134
1.470	-1.216
1.474	-1.271
1.479	-1.112
1.482	-1.084
1.486	-1.172
1.488	-1.102
1.491	-1.086
1.500	-1.140
1.509	-1.059
1.513	-0.931
1.517	-0.973
1.519	-1.095
1.521	-0.931
1.523	-0.841
1.523	-0.953
1.524	-0.861
1.527	-0.901
1.528	-0.923
1.530	-0.885
1.531	-0.931
1.532	-0.907
1.535	-0.937
1.535	-0.917
1.535	-0.895
1.538	-0.933
1.543	-0.933
1.546	-0.939
1.548	-0.844
1.551	-0.862
1.553	-0.933
1.554	-0.820
1.557	-0.852
1.557	-0.824
1.560	-0.878
1.563	-0.854
1.564	-0.810
1.564	-0.868
1.566	-0.848
1.574	-0.816
1.574	-0.798
1.574	-0.748
1.577	-0.768
1.582	-0.708
1.586	-0.760
1.586	-0.740
1.591	-0.727
1.591	-0.751
1.597	-0.659
1.608	-0.679];
data.LWw = 10.^data.LWw; % ^remove log10 transform
data.LWw(:,1) = data.LWw(:,1)/ 8.1; % conver SL to TL
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'HaagComm2007'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is the preferred one, but varied between 7 and 27 C';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZJR'; % Cat of Life
metaData.links.id_ITIS = '201915'; % ITIS
metaData.links.id_EoL = '222853'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_rafinesquei'; % Wikipedia
metaData.links.id_ADW = 'Notropis_rafinesquei'; % ADW
metaData.links.id_Taxo = '181536'; % Taxonomicon
metaData.links.id_WoRMS = '1011211'; % WoRMS
metaData.links.id_fishbase = 'Notropis-rafinesquei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_rafinesquei}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-rafinesquei.html}}';  
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
bibkey = 'HaagComm2007'; type = 'Article'; bib = [ ... 
'author = {Wendell R. Haag and Amym. Commens-Carson and Melvin L. Warren}, ' ... 
'year = {2007}, ' ...
'title = {Life History Variation in the {Y}azoo Shiner (\emph{Notropis rafinesquei}) in three {M}ississippi {S}treams}, ' ...
'journal = {Am. Midl. Nat.}, ' ...
'volume = {158}, ' ...
'pages = {306-320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

