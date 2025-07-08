function [data, auxData, metaData, txtData, weights] = mydata_Notropis_chrosomus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_chrosomus'; 
metaData.species_en = 'Rainbow shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 23]; 

%% set data
% zero-variate data

data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'HoldPowe2010';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'HoldPowe2010'; 
  comment.Lp = 'based on SL 3.55 cm and F2';
data.Li = 8.1;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HoldPowe2010';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 1.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'HoldPowe2010';
data.Wwi = 4.45;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri  = 896/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HoldPowe2010';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
60.668	1.921
89.886	3.082
121.412	3.269
151.821	3.672
181.226	3.457
209.514	3.458
242.101	3.846
302.946	4.451
333.288	5.350
364.886	5.010
392.091	4.965
423.645	4.950
455.218	4.797
486.708	5.247
516.021	5.712
576.940	5.776
608.558	5.282
639.030	5.221
667.282	5.485
697.630	6.337
731.307	6.709
731.307	6.709
759.612	6.587];
data.tL(:,2) = data.tL(:,2)/ 0.9; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HoldPowe2010'; 
comment.tL = 'Data from Moore Creek, Cherokee County, GA';

% time-weight
data.tWw = [ ... % time since birth (yr), wet weight (g)
59.912	0.094
91.049	0.429
122.127	0.5237
152.098	0.6267
184.246	0.5662
216.423	0.6175
245.293	0.7549
303.133	1.4341
335.405	1.8726
364.207	1.7346
396.347	1.6397
426.272	1.5534
457.294	1.4240
486.283	2.0432
516.299	2.3269
577.375	2.6361
609.348	1.8614
640.427	1.9644
670.534	2.6180
701.743	3.2458
733.003	4.0801
761.836	4.0626];
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(20);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HoldPowe2010'; 
comment.tWw = 'Data from Moore Creek, Cherokee County, GA';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Mean temperature is the preferred one, but varied between 7 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.90 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZG5'; % Cat of Life
metaData.links.id_ITIS = '163437'; % ITIS
metaData.links.id_EoL = '217905'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_chrosomus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_chrosomus'; % ADW
metaData.links.id_Taxo = '181498'; % Taxonomicon
metaData.links.id_WoRMS = '1020251'; % WoRMS
metaData.links.id_fishbase = 'Notropis-chrosomus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_chrosomus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-chrosomus.html}}';  
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
bibkey = 'HoldPowe2010'; type = 'Article'; bib = [ ... 
'author = {D. Sean Holder and Steven L. Powers}, ' ... 
'year = {2010}, ' ...
'title = {Life-history Aspects of the Rainbow Shiner, \emph{Notropis chrosomus} ({T}eleostei: {C}yprinidae), in {N}orthern {G}eorgia}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {9(2)}, ' ...
'pages = {347-358}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

