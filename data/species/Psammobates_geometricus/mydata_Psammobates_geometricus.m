function [data, auxData, metaData, txtData, weights] = mydata_Psammobates_geometricus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Psammobates_geometricus'; 
metaData.species_en = 'Geometric tortoise'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 25];

%% set data
% zero-variate data

data.ab = 6.5*30.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Astrochelys radiata, 5 to 8 months';
data.tpm = 5.3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Baar1995';   
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 188*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Astrochelys radiata';
  
data.Lb = 2.81; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Baar1995';
data.Lpm = 8.47; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'Baar1995';
data.Li = 14.25; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';   bibkey.Li = 'Baar1995';
data.Lim = 12.34; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'Baar1995';

data.Wwi = 680; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Baar1995';
data.Wwim = 320; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Baar1995';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Astrochelys radiata, with size correction';
  
% uni-variate data

% length - change in length
data.LdL = [ ... % carapace length (cm), relative growth (ln CL_365/CL_0)/365
3.40177	0.39691
3.63540	0.16091
3.69911	0.19408
3.74159	0.23370
4.18761	0.15249
4.33628	0.14693
4.48496	0.17178
4.65487	0.04178
4.71858	0.09154
4.73982	0.25006
4.97345	0.09056
5.10088	0.07210
5.31327	0.07205
5.33451	0.06559
5.33451	0.08955
5.41947	0.05543
5.46195	0.06741
5.58938	0.03327
5.78053	0.10235
5.84425	0.04335
5.90796	0.01477
5.99292	0.06452
6.03540	0.02488
6.20531	0.07737
6.84248	0.06432
7.54336	0.02545
7.64956	0.08718
8.43540	0.03907
8.58407	0.02429
8.73274	0.07771
8.79646	0.03899
9.07257	0.01957
10.09204	0.00274
10.43186	0.00267
10.51681	0.01463
10.64425	0.00538
10.75044	0.00997
10.81416	0.00719
10.81416	0.01640
11.15398	0.00342
11.79115	0.01249
11.81239	0.00327
11.81239	0.00788
11.96106	0.00139
12.13097	0.00596
12.13097	0.01518
12.21593	0.02622
12.27965	0.00224
12.38584	0.01788
12.81062	0.01686
13.21416	0.04258
13.21416	0.00110
13.59646	0.02406];
data.LdL(:,2) = (data.LdL(:,1) .* exp(data.LdL(:,2)) - data.LdL(:,1)) / 365; % convert to absolute growth
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'carapace length','change in carapace length'};  
temp.LdL    = C2K(24);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Baar1995';
comment.LdL = 'Baar1995 labels the dependent variable as mm CL/yr, but the assumption is that relatice growth is meant in percent per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Lpm = 3 * weights.Lpm;
weights.tpm = 0 * weights.tpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'LdL data is assumed to represent relative growth in percent per yr, rather than mm/yr, since von Bert is reported to fit well; the resulting time since birth ar puberty is 14 yr, rather than the ignorved 5.3 yr';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '4NBHH'; % Cat of Life
metaData.links.id_ITIS = '202116'; % ITIS
metaData.links.id_EoL = '790924'; % Ency of Life
metaData.links.id_Wiki = 'Psammobates_geometricus'; % Wikipedia
metaData.links.id_ADW = 'Psammobates_geometricus'; % ADW
metaData.links.id_Taxo = '548956'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Psammobates&species=geometricus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammobates_geometricus}}';
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
bibkey = 'Baar1995'; type = 'Article'; bib = [ ... 
'doi = {10.1080/04416651.1995.9650383}, ' ...
'author = {E. H. W. Baard}, ' ... 
'year = {1995}, ' ...
'title = {Growth, age at maturity and sexual dimorphism in the geometric tortoise, \emph{Psammobates geometricus}}, ' ...
'journal = {The Journal of the Herpetological Association of Africa}, ' ...
'volume = {44}, ' ...
'number = {1}, ' ...
'pages = {10-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

