function [data, auxData, metaData, txtData, weights] = mydata_Liolaemus_pictus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Liolaemidae';
metaData.species    = 'Liolaemus_pictus'; 
metaData.species_en = 'Orange-bellied lizard'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.8); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 11];

%% set data
% zero-variate data

data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GutiPian2013';   
  temp.tp = C2K(22.8); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'GutiPian2013';   
  temp.am = C2K(22.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess';  
data.Lp  = 4.88;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'GutiPian2013';  
data.Li  = 6.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'GutiPian2013';  

data.Wwi = 32.23;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'EoL';

data.Ri  = 1.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'GutiPian2013';   
  temp.Ri = C2K(22.8);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 young per clutch, 1 clutch each 2 or 3 yrs';

% univariate data
% time -  length data
data.tL = [ ... % age (yr),  SVL (cm)
0.000	2.606
0.003	2.359
0.015	2.468
1.021	3.056
2.978	5.330
3.011	4.268
3.012	4.872
3.013	5.073
3.985	6.027
3.993	4.682
3.995	5.496
3.997	6.110
4.013	3.492
4.040	4.453
4.964	5.562
4.966	6.047
4.987	5.159
5.002	6.212
5.019	4.015
5.983	6.104
5.993	5.665
6.039	4.878
6.976	6.234
6.987	5.886
7.991	5.623
8.016	6.099];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(22.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GutiPian2013';
comment.tL = 'high altitude data (1700 m)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3V6KR'; % Cat of Life
metaData.links.id_ITIS = '1055886'; % ITIS
metaData.links.id_EoL = '791732'; % Ency of Life
metaData.links.id_Wiki = 'Liolaemus_pictus'; % Wikipedia
metaData.links.id_ADW = 'Liolaemus_pictus'; % ADW
metaData.links.id_Taxo = '643898'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Liolaemus&species=pictus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liolaemus_pictus}}';
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
bibkey = 'GutiPian2013'; type = 'Article'; bib = [ ... 
'author = {Joel Ant\''{u} Guti\''{e}rrez and Carla Piantoni and Nora R. Ibarg\"{u}engoyt\''{i}a}, ' ... 
'year = {2013}, ' ...
'title = {Altitudinal effects on life history parameters in populations of \emph{Liolaemus pictus argentinus} ({S}auria: {L}iolaemidae)}, ' ...
'pages = {9-17}, ' ...
'volume = {8(1)}, ' ...
'journal = {Acta Herpetologica}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791732}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
