function [data, auxData, metaData, txtData, weights] = mydata_Chimaera_lignaria

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Chimaeridae';
metaData.species    = 'Chimaera_lignaria'; 
metaData.species_en = 'Giant chimaera'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 27];

%% set data
% zero-variate data;
data.tp = 33*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Bell2012';   
  temp.tp = C2K(3.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 17*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Bell2012';   
  temp.tpm = C2K(3.6); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 43*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Bell2012';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16.4;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on Chimaera_monstrosa';
data.Lp  = 88.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Bell2012';
data.Lpm  = 65.9;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Bell2012';
data.Li  = 142;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 18.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.10, see F1';

data.Ri  = 6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(3.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chimaera_monstrosa';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
17.064	64.421
21.032	62.620
22.068	58.231
22.075	67.461
22.462	78.847
23.115	66.873
23.218	78.272
23.993	101.586
24.070	79.864
24.080	92.895
26.159	91.718
26.999	78.107
27.002	82.451
27.102	88.963
27.106	94.935
28.134	79.687
29.188	98.103
29.193	104.075
29.262	72.036
31.160	81.727
33.051	81.645
36.072	77.713
38.244	75.447
38.249	81.962
39.877	107.955
41.009	105.191
43.083	99.128];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(3.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bell2012';

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
D1 = 'males are suposed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00309*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69RXF'; % Cat of Life
metaData.links.id_ITIS = '621096'; % ITIS
metaData.links.id_EoL = '46561104'; % Ency of Life
metaData.links.id_Wiki = 'Chimaera_lignaria'; % Wikipedia
metaData.links.id_ADW = 'Chimaera_lignaria'; % ADW
metaData.links.id_Taxo = '170832'; % Taxonomicon
metaData.links.id_WoRMS = '271398'; % WoRMS
metaData.links.id_fishbase = 'Chimaera-lignaria'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chimaera_lignaria}}'; 
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
bibkey = 'Bell2012'; type = 'phdthesis'; bib = [ ... 
'author = {Justin David Bell}, ' ...
'year = {2012}, ' ...
'title  = {Reproduction and ageing of Australian holocephalans and white-fin swell shark}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chimaera-lignaria.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

