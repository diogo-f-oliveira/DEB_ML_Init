function [data, auxData, metaData, txtData, weights] = mydata_Timon_lepidus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Timon_lepidus'; 
metaData.species_en = 'Ocellated lizard'; 

metaData.ecoCode.climate = {'BSk', 'Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 06];

%% set data
% zero-variate data

data.ap = 2.5*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'AnAge';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.6;  units.Lb  = 'cm'; label.Lb  = 'SVL at birth'; bibkey.Lb  = 'CastCast1986';  
data.Li  = 21;  units.Li  = 'cm'; label.Li  = 'ultimate SVL'; bibkey.Li  = 'CastCast1986';  

data.Wwi = 549.98 ;  units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 22/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '21 eggs per season';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), femur bone layer (mum)
0.190	3.156
0.190	2.767
0.657	4.887
0.674	4.368
0.738	4.498
0.770	4.714
0.774	2.510
0.785	5.449
0.833	5.924
0.846	8.215
0.851	5.103
0.883	5.190
0.898	6.011
0.928	7.740
0.929	7.221
0.933	4.196
1.754	7.354
1.804	6.447
1.831	10.121
1.835	7.484
1.914	8.867
1.914	8.522
1.915	8.133
1.916	7.441
1.932	7.830
1.992	10.856
2.011	9.257
2.011	8.781
2.060	8.782
2.267	11.289
2.590	11.334
2.730	15.786
2.748	14.144
2.752	11.723
2.780	14.662
2.798	13.193
2.832	12.415
2.846	14.014
2.880	12.545
2.911	13.366
2.912	12.718
2.941	14.922
2.946	11.940
2.955	16.694
2.971	16.824
3.009	13.323
3.688	13.758
3.723	11.900
3.733	16.395
3.834	13.845
3.846	16.481
3.847	15.876
3.859	18.556
3.865	14.537
3.878	16.698
3.939	19.637
3.942	17.649
3.947	14.061
3.983	11.166
4.798	19.078
4.849	17.566
4.851	15.794
4.907	21.845
4.915	16.485
4.945	18.301
4.979	16.658
5.805	16.748
5.833	20.163
5.917	17.872
5.917	17.570
6.802	21.636
6.827	15.455
7.840	20.559
7.855	21.294
10.809	16.852
10.867	21.391
11.777	19.406];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d','cm'};  label.tL = {'time since birth','SVL'};  
temp.tL  = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastCast1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 3 * weights.Lb;

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
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7CBDN'; % Cat of Life
metaData.links.id_ITIS = '1155446'; % ITIS
metaData.links.id_EoL = '790458'; % Ency of Life
metaData.links.id_Wiki = 'Timon_lepidus'; % Wikipedia
metaData.links.id_ADW = 'Timon_lepidus'; % ADW
metaData.links.id_Taxo = '642699'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Timon&species=lepidus'; % ReptileDB
metaData.links.id_AnAge = 'Timon_lepidus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Timon_lepidus}}';
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
bibkey = 'CastCast1986'; type = 'Article'; bib = [ ... 
'author = {M. A. Castilla and J. Castanit}, ' ... 
'year = {1986}, ' ...
'title = {Growth, Age and Longevity of \emph{Lacerta lepida} Assessed by Skeletochronology}, ' ...
'journal = {Studies in Herpetology}, ' ...
'pages = {331-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/790458}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Timon&species=lepidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
