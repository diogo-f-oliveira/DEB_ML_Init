function [data, auxData, metaData, txtData, weights] = mydata_Sotalia_fluviatilis
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Sotalia_fluviatilis'; 
metaData.species_en = 'Tucuxi'; 

metaData.ecoCode.climate = {'MA', 'A'};
metaData.ecoCode.ecozone = {'MAW', 'TN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.2); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2018 07 16];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 16]; 


%% set data
% zero-variate data
data.tg = 325;       units.tg = 'd';  label.tg = 'gestation time';         bibkey.tg = 'AnAge';    
  temp.tg = C2K(37.2); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from bottlenose dolphin';
data.tx =  8.5*30.5;  units.tx = 'd';  label.tx = 'time since birth at weaning';  bibkey.tx = 'guess';    
  temp.tx = C2K(37.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Pontporia';
data.tp =  6*365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(37.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am =   35 * 365;  units.am = 'd';  label.am = 'life span';            bibkey.am = 'ADW';   
  temp.am = C2K(37.2);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 80;  units.Lb = 'cm'; label.Lb = 'length at birth';              bibkey.Lb = 'ADW';
  comment.Lb = 'ADW: 71 to 106 cm';
data.Lp = 177;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'RamoBene2000';
  comment.Lp = 'read from tL-curve at tp';
data.Li = 192;  units.Li = 'cm'; label.Li = 'ultimate length for female';  bibkey.Li = 'RamoBene2000';

data.Wwi = 55000;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'ADW';

data.Ri = 0.5/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Pontporia';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), length (cm)
0.422	107.219
0.929	129.094
0.929	131.187
0.929	132.350
0.929	136.536
0.929	138.397
0.971	121.189
1.942	144.473
1.984	130.055
1.984	134.939
1.984	139.823
2.069	150.755
2.955	155.200
2.955	157.990
2.955	159.618
2.955	164.037
3.040	146.132
4.011	168.254
4.011	170.579
4.011	173.835
4.011	175.696
4.053	156.627
4.053	158.487
4.053	158.953
4.053	165.232
4.053	167.092
4.095	163.372
4.939	177.583
4.982	164.096
4.982	164.794
4.982	166.189
4.982	167.817
4.982	171.305
5.910	178.774
5.953	180.403
5.953	189.240
5.995	161.335
5.995	169.009
5.995	183.195
5.995	185.056
5.995	186.916
6.037	165.057
6.923	185.315
7.008	173.690
7.008	174.852
7.008	186.480
7.008	191.597
7.979	185.578
8.106	187.442
8.106	200.001
9.963	193.543
10.047	187.034
11.018	193.574
18.026	190.289
24.992	197.701
29.931	177.844];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(37.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RamoBene2000';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6Z842'; % Cat of Life
metaData.links.id_ITIS = '180422'; % ITIS
metaData.links.id_EoL = '46559310'; % Ency of Life
metaData.links.id_Wiki = 'Sotalia_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Sotalia_fluviatilis'; % ADW
metaData.links.id_Taxo = '68692'; % Taxonomicon
metaData.links.id_WoRMS = '254982'; % WoRMS
metaData.links.id_MSW3 = '14300080'; % MSW3
metaData.links.id_AnAge = 'Sotalia_fluviatilis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sotalia_fluviatilis}}'; 
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
bibkey = 'RamoBene2000'; type = 'Article'; bib = [ ... 
'author = {R. M. A. Ramos and A. P. M. Di Beneditto and N. R. W. Lima}, ' ... 
'year = {2000}, ' ...
'volume = {26}, ' ...
'pages = {65--75}, ' ...
'title = {Growth parameters of \emph{Pontoporia blainvillei} and \emph{Sotalia fluviatilis} (Cetacea) in northern {R}io de {J}aneiro, {B}razil}, ' ...
'journal = {Aquatic Mammals}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sotalia_fluviatilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sotalia_fluviatilis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

