function [data, auxData, metaData, txtData, weights] = mydata_Myctophum_affine
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Myctophum_affine'; 
metaData.species_en = 'Metallic lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 31];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'HayaWata2001';  
  temp.am = C2K(16.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 7.9;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.53; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00708*Lp^3.11, see F1';
data.Wwi = 4.38; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.11, see F1';
  
data.Ri = 3037/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
0.503	2.351
0.519	2.200
0.538	2.387
0.550	2.237
0.563	2.330
0.572	2.142
0.585	2.329
0.588	2.798
0.600	2.441
0.603	2.329
0.613	2.159
0.619	2.441
0.622	2.797
0.635	2.309
0.641	2.215
0.672	2.401
0.678	1.951
0.694	2.344
0.695	3.301
0.697	1.931
0.713	1.949
0.729	2.361
0.732	1.911
0.836	3.371
0.848	2.376
0.861	3.332
0.867	2.319
0.871	3.838
0.876	2.262
0.889	3.331
0.896	3.856
0.908	2.861
0.927	3.405
0.928	3.761
0.930	3.686
0.931	3.911
0.936	2.785
0.952	2.822
0.958	3.797
0.987	3.796
1.027	3.345
1.592	4.806
1.608	5.330
1.611	4.767
1.627	4.785
1.680	4.821
1.690	5.796
1.727	5.270
1.887	4.888
1.906	5.263
1.928	5.806
1.941	5.618
1.950	5.805
1.966	5.805
1.975	5.654
1.982	5.804
2.004	5.691
2.022	5.765
2.606	6.325
2.922	6.350
2.932	6.312
2.942	6.819
2.948	6.462
2.960	6.368
2.967	6.818
2.973	6.480
2.985	6.348
3.014	6.778];
data.tL(:,1) = (0+data.tL(:,1))*365;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(16.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Odat1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(SL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44ZTC'; % Cat of Life
metaData.links.id_ITIS = '162720'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myctophum_affine'; % Wikipedia
metaData.links.id_ADW = 'Myctophum_affine'; % ADW
metaData.links.id_Taxo = '42962'; % Taxonomicon
metaData.links.id_WoRMS = '158902'; % WoRMS
metaData.links.id_fishbase = 'Myctophum-affine'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myctophum_affine}}';
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
bibkey = 'Odat1996'; type = 'article'; bib = [ ...
'author = {Odate, S.}, ' ... 
'year   = {1966}, ' ...
'title  = {Studies on the fishes of the family {M}yctophidae in the Northeastern {S}ea of {J}apan. {III}. The determination of age and growth of Susuki-Hadaka, \emph{Myctophium affine} ({L}utken)}, ' ...
'journal = {Bull. Tohoku Reg. Fish. Res. Lab.}, ' ...
'page = {35-43}, ' ...
'volume = {26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Myctophum-affine.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

