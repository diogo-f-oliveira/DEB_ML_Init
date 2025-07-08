function [data, auxData, metaData, txtData, weights] = mydata_Calotes_versicolor

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Agamidae';
metaData.species    = 'Calotes_versicolor'; 
metaData.species_en = 'Oriental garden lizard'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 30]; 

%% set data
% zero-variate data;

data.ab = 80;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'PandShan2010';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 210;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PandShan2010';
  temp.tp = C2K(27.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AnAge';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.52;   units.Lb  = 'cm';   label.Lb  = 'SVL at birth';    bibkey.Lb  = 'PandShan2010';  
data.Lp  = 8.3;   units.Lp  = 'cm';   label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'PandShan2010'; 
data.Lpm  = 9.4;   units.Lpm  = 'cm';   label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'PandShan2010'; 
data.Li  = 13.6;   units.Li  = 'cm';   label.Li  = 'ultimate SVL';    bibkey.Li  = 'PandShan2010';

data.Wwi = 71.62;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'EoL';

data.Ri  = 2*14/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'PandShan2010';   
temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11 to 15 eggs per clutch, 1 to 3 clutches per yr';
 
% uni-variate data
% time-length
data.tL = [ ... % time since metam (d), SVL (cm)
0.000	2.510
31.847	3.702
63.695	4.549
88.193	4.769
122.490	5.584
148.213	6.149
184.960	6.588
214.357	7.812
244.980	8.878
275.602	9.851
307.450	10.384
334.398	11.514
367.470	11.514
396.867	12.047
428.715	12.267
459.337	12.612
488.735	12.800
519.357	12.988
549.980	13.176
579.378	13.145
612.450	13.427
641.847	13.427
672.470	13.427
701.867	13.427
732.490	13.365
763.112	13.490
793.735	13.553
824.357	13.584
853.755	13.553
885.602	13.553
916.225	13.584
945.622	13.616
976.245	13.647];
units.tL  = {'d', 'cm'};  label.tL = {'active time since metam', 'SVL'};  
temp.tL   = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PandShan2010';
comment.tL = 'Individual L7';
%
data.tL1 = [ ... % time since metam (d), SVL (cm)
0.000	2.541
31.847	3.420
62.470	4.706
93.092	5.271
127.390	6.212
156.787	7.278
184.960	8.282
215.582	8.973
244.980	9.129
279.277	9.537
308.675	9.914
338.072	10.541
365.020	10.918
401.767	11.545
431.165	12.016
458.112	12.737
488.735	12.737
521.807	12.769
552.430	12.831
578.153	13.051
611.225	13.176
641.847	13.208
671.245	13.302
703.092	13.239
734.940	13.365
763.112	13.427
793.735	13.490
826.807	13.616
856.205	13.678
884.378	13.678
915.000	13.773];
units.tL1  = {'d', 'cm'};  label.tL1 = {'active time since metam', 'SVL'};  
temp.tL1   = C2K(27.7);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'PandShan2010';
comment.tL1 = 'Individual L5';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights 
% zero-variate data:
weights.tL = 50 * weights.tL; 
weights.tL1 = 50 * weights.tL1; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 ={'individuals L7, L5'};
metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'Q467'; % Cat of Life
metaData.links.id_ITIS = '1055526'; % ITIS
metaData.links.id_EoL = '1056997'; % Ency of Life
metaData.links.id_Wiki = 'Calotes_versicolor'; % Wikipedia
metaData.links.id_ADW = 'Calotes_versicolor'; % ADW
metaData.links.id_Taxo = '49169'; % Taxonomicon
metaData.links.id_WoRMS = '1488201'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Calotes&species=versicolor'; % ReptileDB
metaData.links.id_AnAge = 'Calotes_versicolor'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Calotes_versicolor}}'];
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
bibkey = 'PandShan2010'; type = 'Article'; bib = [...
'title = {Growth patterns and reproductive strategies in the lizard, \emph{Calotes versicolor} raised in captivity},'...
'author = {Bhagyarekha N. Pandav and Bhagyashri A. Shanbhag and Srinivas K. Saidapur},'...
'journal = {Acta Herpetologica},'...
'volume = {5(2)},'...
'pages = {131-142},'...
'year = {2010}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{https://eol.org/pages/1056997}}'];
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calotes_versicolor}}'];
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
