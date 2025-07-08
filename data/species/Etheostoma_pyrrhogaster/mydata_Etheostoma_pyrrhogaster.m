  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_pyrrhogaster
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_pyrrhogaster'; 
metaData.species_en = 'Firebelly darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 24]; 

%% set data
% zero-variate data
data.ab = 168/24;   units.ab = 'd';  label.ab = 'age at birth';             bibkey.ab = 'CarnBurr1989';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'CarnBurr1989';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.2;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';   bibkey.Lp = 'CarnBurr1989'; 
data.Li = 5.0;   units.Li = 'cm'; label.Li = 'ultimate standard length';    bibkey.Li = 'CarnBurr1989';

data.Wwb = 7.0e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'CarnBurr1989';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 0.1188;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','CarnBurr1989'};
  comment.Wwp = 'based on 0.00513*(Lp*0.85)^3.14, see F1, F2';
data.Wwi = 0.48;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','CarnBurr1989'};
  comment.Wwi = 'based on 0.00513*(Li*0.85)^3.14, see F1, F2';
 
data.Ri = 102/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';       bibkey.Ri = 'CarnBurr1989';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), std length (mm)
0.445	31.462
0.456	28.654
0.540	30.404
0.689	32.149
0.706	28.640
0.771	28.460
0.784	33.197
0.849	31.263
0.854	28.105
0.951	35.643
0.956	32.660
1.016	35.288
1.033	32.129
1.116	29.317
1.129	35.282
1.188	34.752
1.189	39.313
1.450	38.421
1.539	38.766
1.695	43.845
1.795	42.260
1.861	41.204
1.861	42.783
1.956	41.724
2.039	42.421
2.181	40.834
2.199	42.237
2.461	43.274
2.461	44.151
2.527	44.323
2.551	46.076
2.859	44.479
2.949	49.561];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CarnBurr1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Mean temperature is guessed, but varied between 8 and 25 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL67'; % Cat of Life
metaData.links.id_ITIS = '168459'; % ITIS
metaData.links.id_EoL = '218935'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_pyrrhogaster'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_pyrrhogaster'; % ADW
metaData.links.id_Taxo = '174140'; % Taxonomicon
metaData.links.id_WoRMS = '1011778'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-pyrrhogaster'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_pyrrhogaster}}';  
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
bibkey = 'CarnBurr1989'; type = 'Techreport'; bib = [ ... 
'author = {Douglas A. Carney and Brooks M. Burr}, ' ...
'year = {1989}, ' ...
'title = {Life Histories of the Bandfin Darter, \emph{Etheostoma zonistium}, and the Firebelly Darter, \emph{Etheostoma pyrrhogaster}, in {W}estern {K}entucky}, ' ... 
'institution = {Illinois Natural History Survey}, ' ...
'series = {Biological notes}, ' ...
'volume = {134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-pyrrhogaster.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
