function [data, auxData, metaData, txtData, weights] = mydata_Odorrana_grahami

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Odorrana_grahami'; 
metaData.species_en = 'Diskless-fingered odorous frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data

data.ab = 45;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'YuanZhon2021';   
  temp.tp = C2K(19);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'YuanZhon2021';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.3;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess';
  comment.Lj = 'based on Odorrana_swinhoana';
data.Lp  = 6;      units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'YuanZhon2021';
  comment.Lp = 'based on tL data and tp';
data.Lpm  = 5;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'YuanZhon2021';
  comment.Lpm = 'based on tL data and tp';
data.Li  = 11.3;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'YuanZhon2021';
data.Lim  = 8.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'YuanZhon2021';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm of Odorrana_swinhoana: pi/6*0.3^3';
data.Wwi = 132.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Odorrana_swinhoana: 67*(11.3/9)^3';
data.Wwim = 62.6;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Odorrana_swinhoana: 67*(8.8/9)^3';

data.GSI  = 0.15; units.GSI  = '-'; label.GSI  = 'Gonado Somatic Index';  bibkey.GSI  = 'guess';   
  temp.GSI = C2K(19);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Odorrana_swinhoana';
  
% univariate data
% time-length
data.tL_fm = [ ... % LAG (#), SVL (cm)
1	5.425 5.521
1	5.973 6.102
1   NaN   3.973
1   NaN   5.780
2	6.430 5.785
2	5.946 4.366
2	5.495 NaN
3	9.984 5.242
3	6.177 5.661
3	9.532 5.790
3	9.726 6.081
3  11.274 8.726
4	9.021 8.118
4	6.183 5.409
4	5.828 NaN
4	7.925 NaN
5  10.511 NaN
5	9.156 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert LAG to d since metam
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(19);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'YuanZhon2021'; treat.tL_fm = {1, {'females','males'}}; label.treat.tL_fm = 'Midu County';
comment.tL_fm = 'Data from Midu County, temp from 11 to 22.5 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.GSI = 3 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '48SFL'; % Cat of Life
metaData.links.id_ITIS = '775140'; % ITIS
metaData.links.id_EoL = '1019261'; % Ency of Life
metaData.links.id_Wiki = 'Odorrana_grahami'; % Wikipedia
metaData.links.id_ADW = 'Odorrana_grahami'; % ADW
metaData.links.id_Taxo = '1396899'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Odorrana+grahami'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odorrana_grahami}}';
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
bibkey = 'YuanZhon2021'; type = 'Article'; bib = [ ... 
'doi = {10.16373/j.cnki.ahr.21001}, ' ...
'author = {Lianju Yuan and Maojun Zhong and Wenbo Liao}, ' ... 
'year = {2021}, ' ...
'title = {Age Structure of Two Species of Odorous Frogs (\emph{Odorrana margaretae} and \emph{Odorrana grahami})}, ' ...
'journal = {Asian Herpetological Research}, ' ...
'volume = {12(3)}, ' ...
'pages = {308–314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Odorrana+grahami}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

