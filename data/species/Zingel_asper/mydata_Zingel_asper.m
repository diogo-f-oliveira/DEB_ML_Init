  function [data, auxData, metaData, txtData, weights] = mydata_Zingel_asper
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Zingel_asper'; 
metaData.species_en = 'Apron'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 11];                           
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'}; 

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc  = [2019 02 11]; 

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Gymnocephalus cernuus';

data.Lp = 7;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess';
  comment.Lp = 'base on Gymnocephalus cernuus';
data.Li = 22;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 1 mm: 4/3*pi*0.05^3';
data.Wwi = 100; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                 bibkey.Wwi = 'fishbase';

data.Ri = 2e5/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';          bibkey.Ri = 'guess';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'base on Gymnocephalus cernuus';

% univariate data

% time-length
data.tL = [ ... % time  (d), total length (cm)
 473.227  	7.667
 841.545	11.676
 984.304	12.302
1107.820	12.702
1165.417	12.649
1206.832	14.112
1346.684	13.839
1536.057	14.355
1544.276	14.300];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1);  % set origin at first data point
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DanaLabo2007';
comment.tL = 'Data for individual J';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
% weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;
% weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.kap = weights.psd.kap * 50;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '5D5BD'; % Cat of Life
metaData.links.id_ITIS = '650177'; % ITIS
metaData.links.id_EoL = '994525'; % Ency of Life
metaData.links.id_Wiki = 'Zingel_asper'; % Wikipedia
metaData.links.id_ADW = 'Zingel_asper'; % ADW
metaData.links.id_Taxo = '45205'; % Taxonomicon
metaData.links.id_WoRMS = '1023051'; % WoRMS
metaData.links.id_fishbase = 'Zingel-asper'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Zingel_asper}}';  
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
bibkey = 'CavaPech2003'; type = 'Article'; bib = [ ...  
'doi = {10.1046/j.1095-8649.2003.00168.x}, ' ...
'author = {L. Cavalli and N. Pech and R. Chappaz}, ' ...
'year  = {2003}, ' ...
'title = {Diet and growth of the endangered \emph{Zingel asper} in the {D}urance River}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {63}, ' ...
'pages = {460-471}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DanaLabo2007'; type = 'Article'; bib = [ ...  
'doi = {10.1002/aqc.810}, ' ...    
'author = {D. Danancher and J. Labonne and P. Gaudin and P. Joly}, ' ...
'year  = {2007}, ' ...
'title = {Scale measurements as a conservation tool in endangered \emph{Zingel asper} ({L}innaeus, 1758)}, ' ...  
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}, ' ...
'volume = {17}, ' ...
'pages = {712-723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Zingel_asper}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
