function [data, auxData, metaData, txtData, weights] = mydata_Otolithes_cuvieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Otolithes_cuvieri'; 
metaData.species_en = 'Lesser tigertooth croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jFl', 'jiFr', 'piMc'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 23];

%% set data
% zero-variate data

data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 39;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.79 mm of Otolithoides biauritus: pi/6*0.079^3';
data.Wwp = 149.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.07, see F1';
data.Wwi = 623;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.07, see F1';

data.Ri = 153059/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
181.103	10.501
213.227	12.054
243.023	12.174
273.750	13.989
304.943	15.152
335.670	15.793
365+0.466	15.913
365+29.330	17.468
365+57.730	19.414
365+89.853	19.664
365+118.253	20.566
365+150.842	21.337
365+179.707	21.588
365+212.296	22.620
365+242.557	23.000
365+304.477	24.804
365+333.342	26.359
730+214.624	29.402
730+241.626	30.175
730+274.681	31.467
730+304.943	31.326
730+333.342	31.707
1095-2.793	30.131
1095+30.261	31.946
1095+90.784	33.489
1095+274.681	33.945
1095+334.273	34.837];
data.tL(:,1) = data.tL(:,1)+60; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChakDesm1994';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 15 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 5 * weights.Lp;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4B7FB'; % Cat of Life
metaData.links.id_ITIS = '646658'; % ITIS
metaData.links.id_EoL = '46579087'; % Ency of Life
metaData.links.id_Wiki = 'Otolithes_cuvieri'; % Wikipedia
metaData.links.id_ADW = 'Otolithes_cuvieri'; % ADW
metaData.links.id_Taxo = '182362'; % Taxonomicon
metaData.links.id_WoRMS = '218641'; % WoRMS
metaData.links.id_fishbase = 'Otolithes-cuvieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otolithes_cuvieri}}';
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
bibkey = 'ChakDesm1994'; type = 'article'; bib = [ ... 
'author = {Sushant K. Chakraborty and Vimnay D. Desmukh and Mohammad Zafar Khan and Kuber Vidyasagar and Sadashiv G. Raje}, ' ... 
'year = {1994}, ' ...
'title = {ESTIMATES OF GROWTH, MORTALITY, RECRUITMENT PATTERN AND MSY OF IMPORTANT RESOURCES FROM THE {M}AHARASHTRA COAST}, ' ...
'journal = {Proc. Nat. Symp. Aquacrops}, ' ...
'volume = {24}, ' ...
'pages = {1-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Otolithes-cuvieri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

