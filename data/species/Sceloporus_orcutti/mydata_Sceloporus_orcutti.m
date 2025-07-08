function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_orcutti
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_orcutti';
metaData.species_en = 'Granite spiny lizard';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 05];

%% set data
% zero-variate data;
data.ab = 48;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.25;  units.Lb  = 'cm';  label.Lb  = 'SVL ate birth';   bibkey.Lb  = 'Mayh1963';
  comment.Lb = '3.0-3.5 cm';
data.Lp  = 8.5; units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'Mayh1963a';
data.Li  = 10.8; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';

data.Wwi = 73.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = {'Wiki','Mayh1963'};
  comment.Wwi = 'based on Li and LW data: 17.5*(10.8/6.7)^3';

data.Ri  = 11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Mayh1963a';   
  temp.Ri = C2K(22.7);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-length
data.tL = [... % time (d), SVL (cm)
199.652	3.225
265.800	3.918
299.250	4.047
332.683	4.120
365+1.172	4.025
365+32.943	4.423
365+68.151	4.552
365+100.735	4.728
365+134.943	4.444
365+167.012	5.858
365+198.893	6.637
365+232.394	6.941
365+265.867	7.148
365+299.336	7.341
365+332.046	7.945
730+68.088	7.338
730+99.949	8.045
730+132.448	7.928
730+166.756	7.985
730+199.419	8.431
730+231.075	8.440
730+268.854	8.339
730+297.926	8.531];
data.tL(:,1) = data.tL(:,1) - 198; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
bibkey.tL = 'Mayh1963'; 

% length-weight
data.LW = [... % SVL (cm), weight (g)
4.033  3.140
4.814  5.854
5.298  8.409
5.701 11.551
6.697 17.203
6.696 17.513];
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'Mayh1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lb = 3 * weights.Lb;
weights.Lp = 3 * weights.Lp;
% weights.Wwi = 0 * weights.Wwi;
% weights.Wwim = 0 * weights.Wwim;
% weights.Li = 0 * weights.Li;
% weights.Lim = 0 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed; in tL data it (in C) is supposed to vary as 25*sin(2*pi*(t+t_0)/36';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4V5B8'; % Cat of Life
metaData.links.id_ITIS = '173877'; % ITIS
metaData.links.id_EoL = '790713'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_orcutti'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_orcutti'; % ADW
metaData.links.id_Taxo = '573965'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=orcutti'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_orcutti}}';   
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
bibkey = 'Mayh1963'; type = 'article'; bib = [ ...  
'author = {Wilbur W. Mayhew}, ' ...
'title = {Biology of the Granite Spiny Lizard, \emph{Sceloporus orcutti}}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'pages = {310-327}, ' ...
'volume = {69(2)}, ' ...
'year = {1963}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mayh1963a'; type = 'article'; bib = [ ...  
'author = {Wilbur W. Mayhew}, ' ...
'title = {Reproduction in the Granite Spiny Lizard, \emph{Sceloporus orcutti}}, ' ...
'journal = {Copeia}, ' ...
'pages = {144-152}, ' ...
'volume = {1963(1)}, ' ...
'year = {1963}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

