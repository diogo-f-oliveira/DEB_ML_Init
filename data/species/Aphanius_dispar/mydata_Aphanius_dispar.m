function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_dispar

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_dispar'; 
metaData.species_en = 'Arabian toothcarp'; 

metaData.ecoCode.climate = {'BWh','MA'};
metaData.ecoCode.ecozone = {'THp','MAm','MINW'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 05]; 


%% set data
% zero-variate data

data.am = 4 * 365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 2 mnth and tL data';
data.Li  = 7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 3.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi=  'based on 0.00741*Li^3.18, see F1';
  
data.Ri  = 200/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tWw = [ ... %  time since hatch (d), total length (cm)
12.949	0.025
20.197	0.049
26.765	0.039
32.968	0.094
41.768	0.128
46.777	0.131
53.652	0.249
60.547	0.301
67.810	0.275
75.227	0.313];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(22);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'FrenGore2000';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males as supposed not to differ from females, due to lack of data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00741 * (TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FB5B'; % Cat of Life
metaData.links.id_ITIS = '165722'; % ITIS
metaData.links.id_EoL = '204844'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_dispar'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_dispar'; % ADW
metaData.links.id_Taxo = '44466'; % Taxonomicon
metaData.links.id_WoRMS = '126427'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-dispar'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_dispar}}';
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
bibkey = 'FrenGore2000'; type = 'Article'; bib = [ ... 
'author = {Victor Frenkel and Menachem Goren}, ' ... 
'year = {2000}, ' ...
'title = {Factors affecting growth of killifish, \emph{Aphanius dispar}, a potential biological control of mosquitoes}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {184}, ' ...
'pages = {255-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphanius-dispar.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

